@implementation SAHIDStepSample

- (id)debugDescription
{
  id v3;
  void *v4;
  unint64_t startSampleIndex;
  unint64_t endSampleIndex;
  unint64_t threadId;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SATask debugDescription](self->_task, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  startSampleIndex = self->_startSampleIndex;
  endSampleIndex = self->_endSampleIndex;
  threadId = self->_threadId;
  -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATimestamp debugDescription](self->_endTimestamp, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("hid step sample %@ thread 0x%llx, %lu-%lu, %@-%@"), v4, threadId, startSampleIndex, endSampleIndex, v8, v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
