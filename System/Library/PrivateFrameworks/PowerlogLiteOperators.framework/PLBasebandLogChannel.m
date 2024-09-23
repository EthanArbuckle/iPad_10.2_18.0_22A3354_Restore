@implementation PLBasebandLogChannel

- (PLBasebandLogChannel)init
{
  PLBasebandLogChannel *v2;
  PLBasebandLogChannel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLBasebandLogChannel;
  v2 = -[PLBasebandLogChannel init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->remotePort = 0;
    v2->localPort = 0;
    -[PLBasebandLogChannel setCachingEnabled:](v2, "setCachingEnabled:", 0);
    -[PLBasebandLogChannel setDelegate:](v3, "setDelegate:", 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PLBasebandLogChannel close](self, "close");
  v4.receiver = self;
  v4.super_class = (Class)PLBasebandLogChannel;
  -[PLBasebandLogChannel dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  __CFMessagePort *remotePort;

  if (self->localPort)
  {
    remotePort = self->remotePort;
    if (remotePort)
      LOBYTE(remotePort) = CFMessagePortIsValid(remotePort) != 0;
  }
  else
  {
    LOBYTE(remotePort) = 0;
  }
  return (char)remotePort;
}

- (BOOL)openWithConnection:(id)a3
{
  id v4;
  PLBasebandLogChannel *v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  BOOL v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PLBasebandLogChannel openWithConnection:]";
    _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_INFO, "%s: Entered BB logging channel", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    v17 = MEMORY[0x1E0C809B0];
    v19 = __43__PLBasebandLogChannel_openWithConnection___block_invoke;
    v20 = &unk_1E8578738;
    v18 = 3221225472;
    v21 = CFSTR("Critical");
    v22 = v7;
    if (qword_1ED886878 == -1)
    {
      v8 = CFSTR("Critical");
    }
    else
    {
      dispatch_once(&qword_1ED886878, &v17);
      v8 = (__CFString *)v21;
    }
    v9 = _MergedGlobals_84 == 0;

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Opening BB logging channel"), v17, v18, v19, v20);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandLogChannel openWithConnection:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 53);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_sync_exit(v5);

  return 0;
}

uint64_t __43__PLBasebandLogChannel_openWithConnection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  _MergedGlobals_84 = result;
  return result;
}

- (void)close
{
  PLBasebandLogChannel *v2;
  uint64_t v3;
  __CFString *v4;
  int v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    v14 = MEMORY[0x1E0C809B0];
    v16 = __29__PLBasebandLogChannel_close__block_invoke;
    v17 = &unk_1E8578738;
    v15 = 3221225472;
    v18 = CFSTR("Critical");
    v19 = v3;
    if (qword_1ED886880 == -1)
    {
      v4 = CFSTR("Critical");
    }
    else
    {
      dispatch_once(&qword_1ED886880, &v14);
      v4 = (__CFString *)v18;
    }
    v5 = byte_1ED886871;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Closing BB logging channel"), v14, v15, v16, v17);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandLogChannel close]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 60);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v2->localPort)
  {
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[PLBasebandLogChannel close]";
      _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_INFO, "%s: Entered Port close, local port ", buf, 0xCu);
    }

    CFMessagePortSetInvalidationCallBack(v2->localPort, 0);
    CFMessagePortInvalidate(v2->localPort);
    CFRelease(v2->localPort);
    v2->localPort = 0;
  }
  if (v2->remotePort)
  {
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[PLBasebandLogChannel close]";
      _os_log_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_INFO, "%s: Entered Port remote port", buf, 0xCu);
    }

    CFMessagePortSetInvalidationCallBack(v2->remotePort, 0);
    CFMessagePortInvalidate(v2->remotePort);
    CFRelease(v2->remotePort);
    v2->remotePort = 0;
  }
  objc_sync_exit(v2);

}

uint64_t __29__PLBasebandLogChannel_close__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED886871 = result;
  return result;
}

- (void)invalidate
{
  uint64_t v3;
  __CFString *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLBasebandLogChannel close](self, "close");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    v13 = MEMORY[0x1E0C809B0];
    v15 = __34__PLBasebandLogChannel_invalidate__block_invoke;
    v16 = &unk_1E8578738;
    v14 = 3221225472;
    v17 = CFSTR("Critical");
    v18 = v3;
    if (qword_1ED886888 == -1)
    {
      v4 = CFSTR("Critical");
    }
    else
    {
      dispatch_once(&qword_1ED886888, &v13);
      v4 = (__CFString *)v17;
    }
    v5 = byte_1ED886872;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BB logging channel became Invalid"), v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandLogChannel invalidate]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 81);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandLogChannel delegate](self, "delegate", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "channelDidBecomeInvalid:", self);

}

uint64_t __34__PLBasebandLogChannel_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED886872 = result;
  return result;
}

- (void)flush
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CA7408];
  v5[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandLogChannel sendObjectOverRemotePort:](self, "sendObjectOverRemotePort:", v3);

}

- (void)commitHardwareLogs
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CA73F0];
  v5[0] = &unk_1E8632298;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandLogChannel sendObjectOverRemotePort:](self, "sendObjectOverRemotePort:", v3);

}

- (void)enableLogCodes:(id)a3 andEvents:(id)a4 andExtraCode:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  _QWORD *v13;
  id v14;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[PLBasebandLogChannel cachingEnabled](self, "cachingEnabled");
  v13 = (_QWORD *)MEMORY[0x1E0CA7458];
  if (!v12)
    v13 = (_QWORD *)MEMORY[0x1E0CA7460];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *v13, *MEMORY[0x1E0CA7448]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CA7430]);

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CA7418]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CA7410]);

  -[PLBasebandLogChannel sendObjectOverRemotePort:](self, "sendObjectOverRemotePort:", v14);
}

- (void)sendObjectOverRemotePort:(id)a3
{
  id v4;
  PLBasebandLogChannel *v5;
  const __CFData *Data;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[PLBasebandLogChannel isValid](v5, "isValid"))
  {
    Data = CFPropertyListCreateData(0, v4, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (Data)
    {
      v7 = CFMessagePortSendRequest(v5->remotePort, 0, Data, 1.0, 0.0, 0, 0);
      CFRelease(Data);
      if ((_DWORD)v7)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v8 = objc_opt_class();
          block = MEMORY[0x1E0C809B0];
          v16 = 3221225472;
          v17 = __49__PLBasebandLogChannel_sendObjectOverRemotePort___block_invoke;
          v18 = &__block_descriptor_40_e5_v8__0lu32l8;
          v19 = v8;
          if (qword_1ED886890 != -1)
            dispatch_once(&qword_1ED886890, &block);
          if (byte_1ED886873)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to send object over port (%d)"), v7, block, v16, v17, v18, v19);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLBasebandLogChannel.m");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastPathComponent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandLogChannel sendObjectOverRemotePort:]");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 121);

            PLLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v9;
              _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PLBasebandLogChannel invalidate](v5, "invalidate");
      }
    }
  }
  objc_sync_exit(v5);

}

uint64_t __49__PLBasebandLogChannel_sendObjectOverRemotePort___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886873 = result;
  return result;
}

- (void)setHardwareLoggingLevel:(unint64_t)a3 withWindowSize:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CA7428]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CA7420]);

  if (a3)
  {
    v9 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA73F8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CA7400]);
  }
  -[PLBasebandLogChannel sendObjectOverRemotePort:](self, "sendObjectOverRemotePort:", v10);

}

- (void)setChannelTimeout:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CA7450];
  v4 = *MEMORY[0x1E0CA7438];
  v7[0] = *MEMORY[0x1E0CA7440];
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandLogChannel sendObjectOverRemotePort:](self, "sendObjectOverRemotePort:", v6);

}

- (void)connectionInvalidated:(id)a3
{
  if (self->remotePort || self->localPort)
    -[PLBasebandLogChannel invalidate](self, "invalidate", a3);
}

- (PLBasebandLogChannelDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (PLBasebandLogChannelDelegate *)a3;
}

- (BOOL)cachingEnabled
{
  return self->cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->cachingEnabled = a3;
}

@end
