@implementation VFXAudioPlayer

- (VFXAudioPlayer)initWithSource:(id)a3
{
  VFXAudioPlayer *v4;
  AVAudioPlayerNode *v5;
  VFXAudioSource *v6;
  AVAudioPlayerNode *audioPlayer;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)VFXAudioPlayer;
  v4 = -[VFXAudioPlayer init](&v33, sel_init);
  if (v4)
  {
    v5 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E0C89AD8]);
    v4->_audioNode = &v5->super;
    v4->_audioPlayer = v5;
    v4->_customAudioNode = 0;
    v6 = (VFXAudioSource *)a3;
    v4->_audioSource = v6;
    audioPlayer = v4->_audioPlayer;
    v11 = objc_msgSend_renderingAlgorithm(v6, v8, v9, v10);
    objc_msgSend_setRenderingAlgorithm_(audioPlayer, v12, v11, v13);
    objc_msgSend_rate(v4->_audioSource, v14, v15, v16);
    objc_msgSend_setRate_(v4->_audioPlayer, v17, v18, v19);
    objc_msgSend_volume(v4->_audioSource, v20, v21, v22);
    objc_msgSend_setVolume_(v4->_audioPlayer, v23, v24, v25);
    objc_msgSend_reverbBlend(v4->_audioSource, v26, v27, v28);
    objc_msgSend_setReverbBlend_(v4->_audioPlayer, v29, v30, v31);
  }
  return v4;
}

- (VFXAudioPlayer)initWithAVAudioNode:(id)a3
{
  VFXAudioPlayer *v4;
  AVAudioNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXAudioPlayer;
  v4 = -[VFXAudioPlayer init](&v7, sel_init);
  if (v4)
  {
    v5 = (AVAudioNode *)a3;
    v4->_customAudioNode = 1;
    v4->_audioPlayer = 0;
    v4->_audioSource = 0;
    v4->_audioNode = v5;
  }
  return v4;
}

+ (id)audioPlayerWithAVAudioNode:(id)a3
{
  VFXAudioPlayer *v4;
  const char *v5;
  uint64_t v6;
  id result;

  v4 = [VFXAudioPlayer alloc];
  result = (id)objc_msgSend_initWithAVAudioNode_(v4, v5, (uint64_t)a3, v6);
  *((_BYTE *)result + 50) = 1;
  return result;
}

- (void)reset
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_setWillStartPlayback_(self, a2, 0, v2);
  objc_msgSend_setDidFinishPlayback_(self, v4, 0, v5);
  self->_nodeRef = 0;
  self->_world = 0;

  self->_audioSource = 0;
}

+ (id)audioPlayerWithSource:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void **v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id result;
  VFXAudioPlayer *v39;
  const char *v40;
  uint64_t v41;

  if (qword_1EEF66230 && objc_msgSend_count((void *)qword_1EEF66230, a2, (uint64_t)a3, v3))
  {
    v8 = (void **)objc_msgSend_anyObject((void *)qword_1EEF66230, v5, v6, v7);
    v9 = v8;
    objc_msgSend_removeObject_((void *)qword_1EEF66230, v10, (uint64_t)v8, v11);
    v12 = a3;
    v8[3] = v12;
    v13 = v8[2];
    v17 = objc_msgSend_renderingAlgorithm(v12, v14, v15, v16);
    objc_msgSend_setRenderingAlgorithm_(v13, v18, v17, v19);
    objc_msgSend_rate(v8[3], v20, v21, v22);
    objc_msgSend_setRate_(v8[2], v23, v24, v25);
    objc_msgSend_volume(v8[3], v26, v27, v28);
    objc_msgSend_setVolume_(v8[2], v29, v30, v31);
    objc_msgSend_reverbBlend(v8[3], v32, v33, v34);
    objc_msgSend_setReverbBlend_(v8[2], v35, v36, v37);
    return v8;
  }
  else
  {
    v39 = [VFXAudioPlayer alloc];
    result = (id)objc_msgSend_initWithSource_(v39, v40, (uint64_t)a3, v41);
    *((_BYTE *)result + 50) = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAudioPlayer;
  -[VFXAudioPlayer dealloc](&v3, sel_dealloc);
}

- (void)setNodeRef:(__CFXNode *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_nodeRef = a3;
  if (a3)
    self->_world = (__CFXWorld *)sub_1B17C6244(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (__CFXNode)nodeRef
{
  return self->_nodeRef;
}

- (void)play
{
  uint64_t v2;
  uint64_t v3;
  VFXAudioSource *audioSource;
  AVAudioPlayerNode *audioPlayer;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int shouldStream;
  __CFXNode *nodeRef;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  __CFXNode *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, const char *, uint64_t, uint64_t);
  void *v29;
  VFXAudioPlayer *v30;
  _QWORD v31[8];
  _QWORD v32[8];
  _QWORD block[5];

  audioSource = self->_audioSource;
  if (audioSource && !self->_customAudioNode)
  {
    audioPlayer = self->_audioPlayer;
    v7 = objc_msgSend_audioBuffer(audioSource, a2, v2, v3);
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B18FDC58;
    block[3] = &unk_1E63D6D80;
    block[4] = self;
    objc_msgSend_setCompleted_(self, v9, 0, v10);
    shouldStream = objc_msgSend_shouldStream(self->_audioSource, v11, v12, v13);
    nodeRef = self->_nodeRef;
    if (nodeRef)
      CFRetain(self->_nodeRef);
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = sub_1B18FDC98;
    v32[3] = &unk_1E63D9040;
    v32[6] = block;
    v32[7] = nodeRef;
    v32[4] = self;
    v32[5] = audioPlayer;
    if (v7)
    {
      v19 = objc_msgSend_loops(self->_audioSource, v14, v15, v16);
      objc_msgSend_scheduleBuffer_atTime_options_completionHandler_(audioPlayer, v20, v7, 0, v19, v32);
LABEL_9:
      v26 = v8;
      v27 = 3221225472;
      v28 = sub_1B18FDEBC;
      v29 = &unk_1E63D6D80;
      v30 = self;
      dispatch_async(MEMORY[0x1E0C80D38], &v26);
      return;
    }
    if (shouldStream)
    {
      v21 = objc_msgSend_audioFile(self->_audioSource, v14, v15, v16);
      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = sub_1B18FDD84;
      v31[3] = &unk_1E63D9068;
      v31[4] = self;
      v31[5] = audioPlayer;
      v31[6] = v32;
      v31[7] = nodeRef;
      objc_msgSend_scheduleFile_atTime_completionHandler_(audioPlayer, v22, v21, 0, v31);
      goto LABEL_9;
    }
    v26 = v8;
    v27 = 3221225472;
    v28 = sub_1B18FDEBC;
    v29 = &unk_1E63D6D80;
    v30 = self;
    dispatch_async(MEMORY[0x1E0C80D38], &v26);
    v23 = self->_nodeRef;
    if (v23)
      CFRelease(v23);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend_setCompleted_(self, v24, 1, v25);
  }
}

- (void)recycle
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_sync_enter(self);
  objc_msgSend_reset(self, v3, v4, v5);
  v9 = (void *)qword_1EEF66230;
  if (!qword_1EEF66230)
  {
    qword_1EEF66230 = objc_msgSend_set(MEMORY[0x1E0C99E20], v6, v7, v8);
    v10 = (id)qword_1EEF66230;
    v9 = (void *)qword_1EEF66230;
  }
  objc_msgSend_addObject_(v9, v6, (uint64_t)self, v8);
  objc_sync_exit(self);
}

- (id)audioBufferFormat
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_audioBufferFormat(self->_audioSource, a2, v2, v3);
}

- (id)willStartPlayback
{
  return self->willStartPlayback;
}

- (void)setWillStartPlayback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)didFinishPlayback
{
  return self->didFinishPlayback;
}

- (void)setDidFinishPlayback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (AVAudioNode)audioNode
{
  return self->_audioNode;
}

- (AVAudioPlayerNode)audioPlayer
{
  return self->_audioPlayer;
}

- (VFXAudioSource)audioSource
{
  return self->_audioSource;
}

- (__CFXWorld)world
{
  return self->_world;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)customAudioNode
{
  return self->_customAudioNode;
}

@end
