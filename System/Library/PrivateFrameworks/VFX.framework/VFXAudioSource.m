@implementation VFXAudioSource

+ (VFXAudioSource)audioSourceWithAVAudioPCMBuffer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)a1);
  return (VFXAudioSource *)(id)objc_msgSend_initWithAVAudioPCMBuffer_(v4, v5, (uint64_t)a3, v6);
}

- (VFXAudioSource)initWithAVAudioPCMBuffer:(id)a3
{
  uint64_t v3;
  VFXAudioSource *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = (VFXAudioSource *)objc_msgSend_init(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v5->_audioBuffer = (AVAudioPCMBuffer *)a3;
    objc_msgSend_setPositional_(v5, v6, 1, v7);
    LODWORD(v8) = 1.0;
    objc_msgSend_setVolume_(v5, v9, v10, v11, v8);
    LODWORD(v12) = 1.0;
    objc_msgSend_setRate_(v5, v13, v14, v15, v12);
  }
  return v5;
}

- (int64_t)renderingAlgorithm
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend_isPositional(self, a2, v2, v3))
    return 0;
  else
    return 5;
}

- (void)_loadURLWithBundle:(id)a3
{
  uint64_t v3;
  NSString *audioName;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;

  audioName = self->_audioName;
  if (audioName)
  {
    v7 = (void *)objc_msgSend_pathExtension(audioName, a2, (uint64_t)a3, v3);
    if (v7 && (v11 = (uint64_t)v7, objc_msgSend_length(v7, v8, v9, v10)))
    {
      v14 = objc_msgSend_stringByDeletingPathExtension(self->_audioName, v8, v12, v13);
      v16 = (void *)objc_msgSend_URLForResource_withExtension_(a3, v15, v14, v11);
    }
    else
    {
      v16 = (void *)objc_msgSend_URLForResource_withExtension_(a3, v8, (uint64_t)self->_audioName, (uint64_t)CFSTR("caf"));
      if (v16)
        goto LABEL_9;
      v16 = (void *)objc_msgSend_URLForResource_withExtension_(a3, v23, (uint64_t)self->_audioName, (uint64_t)CFSTR("caff"));
      if (v16)
        goto LABEL_9;
      v16 = (void *)objc_msgSend_URLForResource_withExtension_(a3, v24, (uint64_t)self->_audioName, (uint64_t)CFSTR("aiff"));
    }
    if (!v16)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to load audio source at %@"), v17, v18, v19, v20, v21, v22, (uint64_t)self->_audioName);
      v16 = 0;
    }
LABEL_9:
    self->_audioURL = (NSURL *)v16;
  }
}

- (VFXAudioSource)initWithFileNamed:(id)a3 inBundle:(id)a4
{
  VFXAudioSource *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v6 = (VFXAudioSource *)objc_msgSend_init(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    v6->_audioName = (NSString *)a3;
    objc_msgSend_setPositional_(v6, v7, 1, v8);
    LODWORD(v9) = 1.0;
    objc_msgSend_setVolume_(v6, v10, v11, v12, v9);
    LODWORD(v13) = 1.0;
    objc_msgSend_setRate_(v6, v14, v15, v16, v13);
    objc_msgSend__loadURLWithBundle_(v6, v17, (uint64_t)a4, v18);
  }
  return v6;
}

- (id)fileName
{
  return self->_audioName;
}

- (VFXAudioSource)initWithFileNamed:(id)a3
{
  uint64_t v3;
  uint64_t v6;

  v6 = objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, (uint64_t)a3, v3);
  return (VFXAudioSource *)MEMORY[0x1E0DE7D20](self, sel_initWithFileNamed_inBundle_, a3, v6);
}

- (VFXAudioSource)initWithURL:(id)a3
{
  VFXAudioSource *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VFXAudioSource;
  v4 = -[VFXAudioSource init](&v16, sel_init);
  if (v4)
  {
    v4->_audioURL = (NSURL *)a3;
    objc_msgSend_setPositional_(v4, v5, 1, v6);
    LODWORD(v7) = 1.0;
    objc_msgSend_setVolume_(v4, v8, v9, v10, v7);
    LODWORD(v11) = 1.0;
    objc_msgSend_setRate_(v4, v12, v13, v14, v11);
  }
  return v4;
}

+ (id)audioSourceNamed:(id)a3
{
  uint64_t v3;
  id result;
  VFXAudioSource *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  if (qword_1EEF66240 != -1)
    dispatch_once(&qword_1EEF66240, &unk_1E63D1130);
  result = (id)objc_msgSend_objectForKey_((void *)qword_1EEF66238, a2, (uint64_t)a3, v3);
  if (!result)
  {
    v6 = [VFXAudioSource alloc];
    v9 = objc_msgSend_initWithFileNamed_(v6, v7, (uint64_t)a3, v8);
    v11 = (void *)v9;
    if (a3)
    {
      if (v9)
        objc_msgSend_setObject_forKey_((void *)qword_1EEF66238, v10, v9, (uint64_t)a3);
    }
    return v11;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAudioSource;
  -[VFXAudioSource dealloc](&v3, sel_dealloc);
}

- (void)load
{
  uint64_t v2;
  uint64_t v3;

  if (!self->_loaded)
    objc_msgSend__load(self, a2, v2, v3);
}

- (void)_load
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  AVAudioPCMBuffer *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  self->_loaded = 1;
  if (!self->_audioURL && self->_audioName)
  {
    v5 = objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2, v3);
    objc_msgSend__loadURLWithBundle_(self, v6, v5, v7);
  }
  if (!self->_audioFile && self->_audioURL)
  {
    v32 = 0;
    v8 = objc_alloc(MEMORY[0x1E0C89A98]);
    self->_audioFile = (AVAudioFile *)objc_msgSend_initForReading_error_(v8, v9, (uint64_t)self->_audioURL, (uint64_t)&v32);
  }
  if ((objc_msgSend_shouldStream(self, a2, v2, v3) & 1) == 0 && !self->_audioBuffer && self->_audioFile)
  {
    v32 = 0;
    v10 = objc_alloc(MEMORY[0x1E0C89AC0]);
    v14 = objc_msgSend_processingFormat(self->_audioFile, v11, v12, v13);
    v18 = objc_msgSend_length(self->_audioFile, v15, v16, v17);
    v20 = (AVAudioPCMBuffer *)objc_msgSend_initWithPCMFormat_frameCapacity_(v10, v19, v14, v18);
    self->_audioBuffer = v20;
    if ((objc_msgSend_readIntoBuffer_error_(self->_audioFile, v21, (uint64_t)v20, (uint64_t)&v32) & 1) == 0)
    {
      v25 = objc_msgSend_localizedDescription(v32, v22, v23, v24);
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Error reading file into buffer: %@"), v26, v27, v28, v29, v30, v31, v25);
    }
  }
}

- (void)loadIfNeeded
{
  uint64_t v2;
  uint64_t v3;

  if (!self->_loaded)
    objc_msgSend_load(self, a2, v2, v3);
}

- (id)audioBufferFormat
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_loadIfNeeded(self, a2, v2, v3);
  return (id)objc_msgSend_format(self->_audioBuffer, v5, v6, v7);
}

- (id)audioBuffer
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_loadIfNeeded(self, a2, v2, v3);
  return self->_audioBuffer;
}

- (id)audioFile
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_loadIfNeeded(self, a2, v2, v3);
  return self->_audioFile;
}

- (double)duration
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  AVAudioFile *audioFile;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;

  if ((objc_msgSend_loops(self, a2, v2, v3) & 1) != 0)
    return 1.79769313e308;
  objc_msgSend_loadIfNeeded(self, v5, v6, v7);
  audioFile = self->_audioFile;
  if (!audioFile)
    return 0.0;
  if (self->_audioBuffer)
    v16 = (float)objc_msgSend_frameLength(self->_audioBuffer, v9, v10, v11);
  else
    v16 = (double)objc_msgSend_length(audioFile, v9, v10, v11);
  v17 = (void *)objc_msgSend_fileFormat(self->_audioFile, v13, v14, v15);
  objc_msgSend_sampleRate(v17, v18, v19, v20);
  return v16 / v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  NSString *audioName;
  void *v6;
  id v7;
  AVAudioPCMBuffer *audioBuffer;
  VFXAudioSource *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t isPositional;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t shouldStream;
  const char *v38;
  uint64_t v39;

  audioName = self->_audioName;
  if (audioName)
  {
    v6 = (void *)objc_msgSend_audioSourceNamed_(VFXAudioSource, a2, (uint64_t)audioName, v3);
  }
  else
  {
    if (self->_audioURL)
    {
      v9 = [VFXAudioSource alloc];
      v7 = (id)objc_msgSend_initWithURL_(v9, v10, (uint64_t)self->_audioURL, v11);
      goto LABEL_6;
    }
    audioBuffer = self->_audioBuffer;
    if (!audioBuffer)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v6 = (void *)objc_msgSend_audioSourceWithAVAudioPCMBuffer_(VFXAudioSource, a2, (uint64_t)audioBuffer, v3);
  }
  v7 = v6;
LABEL_6:
  v12 = v7;
LABEL_7:
  isPositional = objc_msgSend_isPositional(self, a2, (uint64_t)audioBuffer, v3);
  objc_msgSend_setPositional_(v12, v14, isPositional, v15);
  objc_msgSend_volume(self, v16, v17, v18);
  objc_msgSend_setVolume_(v12, v19, v20, v21);
  objc_msgSend_rate(self, v22, v23, v24);
  objc_msgSend_setRate_(v12, v25, v26, v27);
  v31 = objc_msgSend_loops(self, v28, v29, v30);
  objc_msgSend_setLoops_(v12, v32, v31, v33);
  shouldStream = objc_msgSend_shouldStream(self, v34, v35, v36);
  objc_msgSend_setShouldStream_(v12, v38, shouldStream, v39);
  return v12;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_customEncodingOfVFXAudioSource:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *audioName;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t isPositional;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t shouldStream;
  const char *v40;
  uint64_t v41;

  audioName = self->_audioName;
  if (audioName)
  {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)audioName, (uint64_t)CFSTR("name"));
  }
  else if (self->_audioURL)
  {
    objc_msgSend_encodeObject_forKey_(a3, a2, 0, (uint64_t)CFSTR("url"));
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: can't archive audio data directly"), 0, v3, v4, v5, v6, v7, v41);
  }
  objc_msgSend_volume(self, v11, v12, v13);
  objc_msgSend_encodeFloat_forKey_(a3, v14, (uint64_t)CFSTR("volume"), v15);
  objc_msgSend_rate(self, v16, v17, v18);
  objc_msgSend_encodeFloat_forKey_(a3, v19, (uint64_t)CFSTR("rate"), v20);
  objc_msgSend_reverbBlend(self, v21, v22, v23);
  objc_msgSend_encodeFloat_forKey_(a3, v24, (uint64_t)CFSTR("reverbBlend"), v25);
  isPositional = objc_msgSend_isPositional(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(a3, v30, isPositional, (uint64_t)CFSTR("positional"));
  v34 = objc_msgSend_loops(self, v31, v32, v33);
  objc_msgSend_encodeBool_forKey_(a3, v35, v34, (uint64_t)CFSTR("loops"));
  shouldStream = objc_msgSend_shouldStream(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(a3, v40, shouldStream, (uint64_t)CFSTR("shouldStream"));
}

- (void)_customDecodingOfVFXAudioSource:(id)a3
{
  uint64_t v3;
  _QWORD *p_audioName;
  const __CFString *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;

  p_audioName = &self->_audioName;
  if (self->_audioName)
  {
    v7 = CFSTR("name");
LABEL_5:
    v8 = objc_opt_class();
    *p_audioName = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)v7);
    goto LABEL_6;
  }
  p_audioName = &self->_audioURL;
  if (self->_audioURL)
  {
    v7 = CFSTR("url");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend_decodeFloatForKey_(a3, a2, (uint64_t)CFSTR("volume"), v3);
  objc_msgSend_setVolume_(self, v10, v11, v12);
  objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("rate"), v14);
  objc_msgSend_setRate_(self, v15, v16, v17);
  objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("reverbBlend"), v19);
  objc_msgSend_setReverbBlend_(self, v20, v21, v22);
  v25 = objc_msgSend_decodeBoolForKey_(a3, v23, (uint64_t)CFSTR("positional"), v24);
  objc_msgSend_setPositional_(self, v26, v25, v27);
  v30 = objc_msgSend_decodeBoolForKey_(a3, v28, (uint64_t)CFSTR("loops"), v29);
  objc_msgSend_setLoops_(self, v31, v30, v32);
  v35 = objc_msgSend_decodeBoolForKey_(a3, v33, (uint64_t)CFSTR("shouldStream"), v34);
  objc_msgSend_setShouldStream_(self, v36, v35, v37);
  objc_msgSend_loadIfNeeded(self, v38, v39, v40);
}

- (void)encodeWithCoder:(id)a3
{
  ((void (*)(VFXAudioSource *, char *, id))MEMORY[0x1E0DE7D20])(self, sel__customEncodingOfVFXAudioSource_, a3);
}

- (VFXAudioSource)initWithCoder:(id)a3
{
  uint64_t v3;
  VFXAudioSource *v5;
  const char *v6;
  uint64_t v7;
  VFXAudioSource *v8;

  v5 = (VFXAudioSource *)objc_msgSend_init(self, a2, (uint64_t)a3, v3);
  v8 = v5;
  if (v5)
    objc_msgSend__customDecodingOfVFXAudioSource_(v5, v6, (uint64_t)a3, v7);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)volume
{
  return self->volume;
}

- (void)setVolume:(float)a3
{
  self->volume = a3;
}

- (BOOL)isPositional
{
  return self->positional;
}

- (void)setPositional:(BOOL)a3
{
  self->positional = a3;
}

- (float)rate
{
  return self->rate;
}

- (void)setRate:(float)a3
{
  self->rate = a3;
}

- (float)reverbBlend
{
  return self->reverbBlend;
}

- (void)setReverbBlend:(float)a3
{
  self->reverbBlend = a3;
}

- (BOOL)loops
{
  return self->_loops;
}

- (void)setLoops:(BOOL)a3
{
  self->_loops = a3;
}

- (BOOL)shouldStream
{
  return self->_shouldStream;
}

- (void)setShouldStream:(BOOL)a3
{
  self->_shouldStream = a3;
}

@end
