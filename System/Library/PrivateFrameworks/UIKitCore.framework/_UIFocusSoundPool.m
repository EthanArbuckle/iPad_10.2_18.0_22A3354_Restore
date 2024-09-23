@implementation _UIFocusSoundPool

- (_UIFocusSoundPool)initWithSystemSoundID:(unsigned int)a3
{
  _UIFocusSoundPool *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusSoundPool;
  result = -[_UIFocusSoundPool init](&v5, sel_init);
  if (result)
  {
    result->_originalSystemSoundID = a3;
    result->_queueIndex = 0;
  }
  return result;
}

- (_UIFocusSoundPool)initWithSoundFileURL:(id)a3
{
  id v5;
  _UIFocusSoundPool *v6;
  _UIFocusSoundPool *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusSoundPool;
  v6 = -[_UIFocusSoundPool init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_soundFileURL, a3);
    v7->_queueIndex = 0;
  }

  return v7;
}

- (unsigned)playableSystemSoundID
{
  NSArray *queue;
  NSURL *soundFileURL;
  NSURL *v5;
  uint64_t v6;
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t originalSystemSoundID;
  void *v14;
  void *v15;
  NSArray *v16;
  void *v17;
  unsigned int v18;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;

  queue = self->_queue;
  if (!queue)
  {
    soundFileURL = self->_soundFileURL;
    if (soundFileURL)
    {
      v5 = soundFileURL;
      v6 = 10;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
      do
      {
        v22 = 0;
        v8 = v5;
        v23 = 0;
        v24 = &v23;
        v25 = 0x2020000000;
        v9 = off_1ECD7DBB8;
        v26 = off_1ECD7DBB8;
        if (!off_1ECD7DBB8)
        {
          v10 = AudioToolboxLibrary_0();
          v9 = dlsym(v10, "AudioServicesCreateSystemSoundID");
          v24[3] = (uint64_t)v9;
          off_1ECD7DBB8 = v9;
        }
        _Block_object_dispose(&v23, 8);
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OSStatus __AudioServicesCreateSystemSoundID(CFURLRef, SystemSoundID *)");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIFocusSoundGenerator.m"), 30, CFSTR("%s"), dlerror());
          while (1)
          {

            __break(1u);
LABEL_17:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFArrayRef __AudioServicesCreateSystemSoundIDsFromID(SystemSoundID, UInt32)");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIFocusSoundGenerator.m"), 31, CFSTR("%s"), dlerror());
          }
        }
        ((void (*)(NSURL *, unsigned int *))v9)(v8, &v22);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

        --v6;
      }
      while (v6);
      v12 = (NSArray *)objc_msgSend(v7, "copy");

    }
    else
    {
      originalSystemSoundID = self->_originalSystemSoundID;
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v14 = off_1ECD7DBB0;
      v26 = off_1ECD7DBB0;
      if (!off_1ECD7DBB0)
      {
        v15 = AudioToolboxLibrary_0();
        v14 = dlsym(v15, "AudioServicesCreateSystemSoundIDsFromID");
        v24[3] = (uint64_t)v14;
        off_1ECD7DBB0 = v14;
      }
      _Block_object_dispose(&v23, 8);
      if (!v14)
        goto LABEL_17;
      v12 = (NSArray *)((uint64_t (*)(uint64_t, uint64_t))v14)(originalSystemSoundID, 10);
    }
    v16 = self->_queue;
    self->_queue = v12;

    queue = self->_queue;
  }
  ++self->_queueIndex;
  -[NSArray objectAtIndexedSubscript:](queue, "objectAtIndexedSubscript:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  self->_queueIndex %= -[NSArray count](self->_queue, "count");
  return v18;
}

- (unsigned)originalSystemSoundID
{
  return self->_originalSystemSoundID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_soundFileURL, 0);
}

@end
