@implementation TIProgressTracker

- (TIProgressTracker)initWithIntendedString:(id)a3 repeatLimit:(int64_t)a4 timeout:(double)a5 badSentencePath:(id)a6
{
  id v11;
  id v12;
  TIProgressTracker *v13;
  TIProgressTracker *v14;
  uint64_t v15;
  NSDate *startTime;
  uint64_t v17;
  NSCountedSet *priorStates;
  uint64_t v19;
  NSMutableArray *stateTranscript;
  uint64_t v21;
  NSString *badSentenceFilePath;
  objc_super v24;

  v11 = a3;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIProgressTracker;
  v13 = -[TIProgressTracker init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_repeatLimit = a4;
    v13->_timeout = a5;
    objc_storeStrong((id *)&v13->_intended, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v15 = objc_claimAutoreleasedReturnValue();
    startTime = v14->_startTime;
    v14->_startTime = (NSDate *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithCapacity:", 100);
    priorStates = v14->_priorStates;
    v14->_priorStates = (NSCountedSet *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 200);
    v19 = objc_claimAutoreleasedReturnValue();
    stateTranscript = v14->_stateTranscript;
    v14->_stateTranscript = (NSMutableArray *)v19;

    v21 = objc_msgSend(v12, "copy");
    badSentenceFilePath = v14->_badSentenceFilePath;
    v14->_badSentenceFilePath = (NSString *)v21;

  }
  return v14;
}

- (BOOL)shouldStopAfterAddingStateString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  BOOL v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIProgressTracker priorStates](self, "priorStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[TIProgressTracker stateTranscript](self, "stateTranscript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIProgressTracker startTime](self, "startTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  -[TIProgressTracker priorStates](self, "priorStates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countForObject:", v4);

  if (v12 <= -[TIProgressTracker repeatLimit](self, "repeatLimit")
    && (-[TIProgressTracker timeout](self, "timeout"), v10 <= v13))
  {
    v14 = 0;
  }
  else
  {
    -[TIProgressTracker saveBadSentenceAndTranscript:](self, "saveBadSentenceAndTranscript:", -[TIProgressTracker stoppageReason](self, "stoppageReason"));
    v14 = 1;
  }

  return v14;
}

- (unint64_t)stoppageReason
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  unint64_t v13;
  double v14;

  -[TIProgressTracker stateTranscript](self, "stateTranscript");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIProgressTracker startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  -[TIProgressTracker priorStates](self, "priorStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countForObject:", v4);

  -[TIProgressTracker intended](self, "intended");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v4);

  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else if (v10 <= -[TIProgressTracker repeatLimit](self, "repeatLimit"))
  {
    -[TIProgressTracker timeout](self, "timeout");
    if (v8 <= v14)
      v13 = 3;
    else
      v13 = 2;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)saveBadSentenceAndTranscript:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[TIProgressTracker badSentenceFilePath](self, "badSentenceFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIProgressTracker intended](self, "intended");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIProgressTracker badSentenceFilePath](self, "badSentenceFilePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIProgressTracker appendStringToFile:atFilePath:](self, "appendStringToFile:atFilePath:", v6, v7);

  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[TIProgressTracker intended](self, "intended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("> %-10@ >> %@"), CFSTR("Intended"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  if (a3 > 3)
    v12 = 0;
  else
    v12 = off_24FD481D8[a3];
  -[TIProgressTracker stateTranscript](self, "stateTranscript");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("> %-10@ << %@"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  v22[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIProgressTracker stateTranscript](self, "stateTranscript");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingString:", CFSTR("\n\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIProgressTracker badSentenceTranscriptFilePath](self, "badSentenceTranscriptFilePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIProgressTracker appendStringToFile:atFilePath:](self, "appendStringToFile:atFilePath:", v20, v21);

}

- (void)appendStringToFile:(id)a3 atFilePath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  if (v12)
  {
    v5 = (void *)MEMORY[0x24BDD1580];
    v6 = a3;
    objc_msgSend(v5, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "fileExistsAtPath:", v12) & 1) == 0
      && (objc_msgSend(v7, "createFileAtPath:contents:attributes:", v12, 0, 0) & 1) == 0)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Error: unable to write log file '%s'.\n", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    }
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "seekToEndOfFile");
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "writeData:", v9);
    objc_msgSend(v8, "closeFile");
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1578];
    v11 = a3;
    objc_msgSend(v10, "fileHandleWithStandardOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "writeData:", v7);
  }

}

- (BOOL)limitsReached
{
  return self->_limitsReached;
}

- (int64_t)repeatLimit
{
  return self->_repeatLimit;
}

- (void)setRepeatLimit:(int64_t)a3
{
  self->_repeatLimit = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSCountedSet)priorStates
{
  return self->_priorStates;
}

- (void)setPriorStates:(id)a3
{
  objc_storeStrong((id *)&self->_priorStates, a3);
}

- (NSMutableArray)stateTranscript
{
  return self->_stateTranscript;
}

- (void)setStateTranscript:(id)a3
{
  objc_storeStrong((id *)&self->_stateTranscript, a3);
}

- (NSString)badSentenceFilePath
{
  return self->_badSentenceFilePath;
}

- (void)setBadSentenceFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)badSentenceTranscriptFilePath
{
  return self->_badSentenceTranscriptFilePath;
}

- (void)setBadSentenceTranscriptFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badSentenceTranscriptFilePath, 0);
  objc_storeStrong((id *)&self->_badSentenceFilePath, 0);
  objc_storeStrong((id *)&self->_stateTranscript, 0);
  objc_storeStrong((id *)&self->_priorStates, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_intended, 0);
}

@end
