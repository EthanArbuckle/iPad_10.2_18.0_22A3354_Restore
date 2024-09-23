@implementation PXGTungstenRecordingJSONSerializer

- (void)recordingSessionWillStartToStream:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(CFSTR("{\"events\" : ["), "dataUsingEncoding:", 4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));

}

- (void)recordingSessionWillEndToStream:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(CFSTR("]}"), "dataUsingEncoding:", 4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));

}

- (void)serializeEvent:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_eventCount)
  {
    objc_msgSend(CFSTR(","), "dataUsingEncoding:", 4);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "write:maxLength:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

    v9 = self->_eventCount + 1;
  }
  else
  {
    v9 = 1;
  }
  self->_eventCount = v9;
  objc_msgSend(v6, "serializable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", object_getClassName(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "component"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(v6, "eventName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  v22[2] = v11;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "timestamp");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v15;
  objc_msgSend(v6, "threadDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "createSerializableObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("info");
  v20[1] = CFSTR("event");
  v21[0] = v17;
  v21[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "writeJSONObject:toStream:options:error:", v19, v7, -[PXGTungstenRecordingJSONSerializer options](self, "options"), 0);

}

- (unint64_t)options
{
  unint64_t v3;

  v3 = -[PXGTungstenRecordingJSONSerializer prettyPrint](self, "prettyPrint");
  if (-[PXGTungstenRecordingJSONSerializer sortKeys](self, "sortKeys"))
    return v3 | 2;
  else
    return v3;
}

- (BOOL)prettyPrint
{
  return self->_prettyPrint;
}

- (void)setPrettyPrint:(BOOL)a3
{
  self->_prettyPrint = a3;
}

- (BOOL)sortKeys
{
  return self->_sortKeys;
}

- (void)setSortKeys:(BOOL)a3
{
  self->_sortKeys = a3;
}

@end
