@implementation RCPStdinEventStreamGenerator

- (RCPStdinEventStreamGenerator)init
{
  RCPStdinEventStreamGenerator *v2;
  uint64_t v3;
  NSInputStream *stdin;
  uint64_t v5;
  NSMutableArray *commandBuffer;
  uint64_t v7;
  NSMutableString *stringBuffer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCPStdinEventStreamGenerator;
  v2 = -[RCPStdinEventStreamGenerator init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithFileAtPath:", CFSTR("/dev/stdin"));
    stdin = v2->_stdin;
    v2->_stdin = (NSInputStream *)v3;

    v5 = objc_opt_new();
    commandBuffer = v2->_commandBuffer;
    v2->_commandBuffer = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    stringBuffer = v2->_stringBuffer;
    v2->_stringBuffer = (NSMutableString *)v7;

    -[NSInputStream open](v2->_stdin, "open");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSInputStream close](self->_stdin, "close");
  v3.receiver = self;
  v3.super_class = (Class)RCPStdinEventStreamGenerator;
  -[RCPStdinEventStreamGenerator dealloc](&v3, sel_dealloc);
}

- (BOOL)_processBuffer
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSInteger v7;
  void *v8;
  NSMutableString *stringBuffer;
  uint64_t v10;
  _QWORD v12[5];

  if (-[NSMutableArray count](self->_commandBuffer, "count"))
    return 1;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    while (!-[NSInputStream hasBytesAvailable](self->_stdin, "hasBytesAvailable")
         && -[NSInputStream streamStatus](self->_stdin, "streamStatus") == 2)
      ;
    v5 = -[NSInputStream streamStatus](self->_stdin, "streamStatus");
    v3 = v5 == 2;
    if (v5 != 2)
      break;
    v6 = malloc_type_calloc(0xFFuLL, 1uLL, 0x100004077774924uLL);
    if (-[NSInputStream hasBytesAvailable](self->_stdin, "hasBytesAvailable"))
    {
      do
      {
        v7 = -[NSInputStream read:maxLength:](self->_stdin, "read:maxLength:", v6, 255);
        if (!v7)
          return 0;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, v7, 4);
        -[NSMutableString appendString:](self->_stringBuffer, "appendString:", v8);
        stringBuffer = self->_stringBuffer;
        v10 = -[NSMutableString length](stringBuffer, "length");
        v12[0] = v4;
        v12[1] = 3221225472;
        v12[2] = __46__RCPStdinEventStreamGenerator__processBuffer__block_invoke;
        v12[3] = &unk_1E4FC2068;
        v12[4] = self;
        -[NSMutableString enumerateSubstringsInRange:options:usingBlock:](stringBuffer, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 0, v12);

      }
      while (-[NSInputStream hasBytesAvailable](self->_stdin, "hasBytesAvailable"));
    }
  }
  while (!-[NSMutableArray count](self->_commandBuffer, "count"));
  return v3;
}

void __46__RCPStdinEventStreamGenerator__processBuffer__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  if (v13 && a3 + a4 != a5 + a6)
  {
    RCPLogPlayback();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1A5E84000, v15, OS_LOG_TYPE_DEFAULT, "Found full command: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "deleteCharactersInRange:", a5, a6);
  }
  else
  {
    RCPLogPlayback();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1A5E84000, v14, OS_LOG_TYPE_DEFAULT, "Found partial command: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    *a7 = 1;
  }

}

- (id)nextEventStream
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[RCPStdinEventStreamGenerator _processBuffer](self, "_processBuffer"))
    return 0;
  -[NSMutableArray firstObject](self->_commandBuffer, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_commandBuffer, "removeObjectAtIndex:", 0);
  RCPLogPlayback();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1A5E84000, v4, OS_LOG_TYPE_DEFAULT, "Generating event stream for command: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[RCPSyntheticEventStream eventStreamWithCLIArguments:](RCPSyntheticEventStream, "eventStreamWithCLIArguments:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringBuffer, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_stdin, 0);
}

@end
