@implementation VTAudioCircularBuffer

- (VTAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(unint64_t)a4 samplingRate:(unint64_t)a5
{
  VTAudioCircularBuffer *v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *value;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  objc_super v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)VTAudioCircularBuffer;
  v8 = -[VTAudioCircularBuffer init](&v22, sel_init);
  if (v8)
  {
    v9 = (unint64_t *)operator new();
    *v9 = a3;
    v9[1] = a4;
    v9[2] = a5;
    v9[3] = a5 * a4;
    v9[4] = 0;
    v9[5] = 0;
    v10 = operator new[]();
    v9[6] = v10;
    v9[7] = 0;
    v11 = *v9;
    v9[8] = 0;
    v9[9] = 0;
    if (v11)
    {
      if (v11 >> 61)
        std::vector<unsigned short const*>::__throw_length_error[abi:ne180100]();
      v12 = (char *)operator new(8 * v11);
      v9[7] = (unint64_t)v12;
      v9[9] = (unint64_t)&v12[8 * v11];
      bzero(v12, 8 * v11);
      v13 = 0;
      v9[8] = (unint64_t)&v12[8 * v11];
      v14 = 2 * v9[3];
      do
      {
        *(_QWORD *)(v9[7] + 8 * v13++) = v10;
        v10 += v14;
      }
      while (v11 != v13);
    }
    value = v8->_vtAudioCircularBufferImpl.__ptr_.__value_;
    v8->_vtAudioCircularBufferImpl.__ptr_.__value_ = v9;
    if (value)
    {
      v16 = (void *)value[7];
      if (v16)
      {
        value[8] = v16;
        operator delete(v16);
      }
      v17 = value[6];
      value[6] = 0;
      if (v17)
        MEMORY[0x212BAC9C0](v17, 0x1000C80BDFB0063);
      MEMORY[0x212BAC9D8](value, 0x1090C4018C15A78);
    }
    v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349568;
      v24 = a3;
      v25 = 2050;
      v26 = a4;
      v27 = 2050;
      v28 = a5;
      _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "numChannels: %{public}lu, recordingDuration: %{public}lu, sampleRate: %{public}lu", buf, 0x20u);
    }
    v8->_bufferLength = *((_QWORD *)v8->_vtAudioCircularBufferImpl.__ptr_.__value_ + 3);
    v19 = dispatch_queue_create("VTAudioCircularBuffer", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v19;

  }
  return v8;
}

- (void)addSamples:(void *)a3 numSamples:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VTAudioCircularBuffer_addSamples_numSamples___block_invoke;
  block[3] = &unk_24C7F3918;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4 withNumSamplesCopiedIn:(unint64_t *)a5
{
  NSObject *queue;
  id v6;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__VTAudioCircularBuffer_copySamplesFrom_to_withNumSamplesCopiedIn___block_invoke;
  block[3] = &unk_24C7F3940;
  block[6] = a3;
  block[7] = a4;
  block[4] = self;
  block[5] = &v9;
  block[8] = a5;
  dispatch_sync(queue, block);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)copyBufferWithNumSamplesCopiedIn:(unint64_t *)a3
{
  _QWORD *value;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  value = self->_vtAudioCircularBufferImpl.__ptr_.__value_;
  v6 = value[5];
  v7 = value[3];
  v8 = v6 >= v7;
  v9 = v6 - v7;
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *a3;
    v14 = 134349568;
    v15 = v10;
    v16 = 2050;
    v17 = v6;
    v18 = 2050;
    v19 = v12;
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "copyBuffer: oldestSample: %{public}lu latestSample: %{public}lu, numSamplesCopied: %{public}lu", (uint8_t *)&v14, 0x20u);
  }
  return -[VTAudioCircularBuffer copySamplesFrom:to:withNumSamplesCopiedIn:](self, "copySamplesFrom:to:withNumSamplesCopiedIn:", v10, v6, a3);
}

- (void)reset
{
  NSObject *v3;
  _QWORD *value;
  uint8_t v5[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "VTAudioCircularBuffer.reset", v5, 2u);
  }
  value = self->_vtAudioCircularBufferImpl.__ptr_.__value_;
  value[4] = 0;
  value[5] = 0;
}

- (unint64_t)sampleCount
{
  return *((_QWORD *)self->_vtAudioCircularBufferImpl.__ptr_.__value_ + 5);
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8;
  NSObject *v9;
  AudioFileWriter *v10;
  NSObject *queue;
  AudioFileWriter *v12;
  _QWORD v13[5];
  AudioFileWriter *v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  double v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349570;
    v24 = a3;
    v25 = 2050;
    v26 = a4;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "saveRecordingBufferFrom: %{public}lu to: %{public}lu toURL: %{public}@", buf, 0x20u);
  }
  v20 = (double)*((unint64_t *)self->_vtAudioCircularBufferImpl.__ptr_.__value_ + 2);
  v21 = xmmword_20DA245E0;
  v22 = xmmword_20DA245F0;
  v17 = v20;
  v18 = xmmword_20DA245E0;
  v19 = xmmword_20DA245F0;
  v10 = -[AudioFileWriter initWithURL:inputFormat:outputFormat:]([AudioFileWriter alloc], "initWithURL:inputFormat:outputFormat:", v8, &v20, &v17);
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__VTAudioCircularBuffer_saveRecordingBufferFrom_to_toURL___block_invoke;
  v13[3] = &unk_24C7F3968;
  v15 = a3;
  v16 = a4;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_sync(queue, v13);

}

- (unint64_t)bufferLength
{
  return self->_bufferLength;
}

- (void)setBufferLength:(unint64_t)a3
{
  self->_bufferLength = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  _QWORD *value;
  void *v4;
  uint64_t v5;

  objc_storeStrong((id *)&self->_queue, 0);
  value = self->_vtAudioCircularBufferImpl.__ptr_.__value_;
  self->_vtAudioCircularBufferImpl.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = (void *)value[7];
    if (v4)
    {
      value[8] = v4;
      operator delete(v4);
    }
    v5 = value[6];
    value[6] = 0;
    if (v5)
      MEMORY[0x212BAC9C0](v5, 0x1000C80BDFB0063);
    JUMPOUT(0x212BAC9D8);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

uint64_t __58__VTAudioCircularBuffer_saveRecordingBufferFrom_to_toURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::ios_base *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  size_t v31;
  void **p_dst;
  unint64_t v33;
  const void **v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  void *v40;
  size_t v41;
  _BYTE *v42;
  _QWORD *v43;
  unint64_t v44;
  const void **v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  void *v50;
  NSObject *v51;
  void **v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];
  uint64_t v64;
  _QWORD v65[2];
  _QWORD v66[3];
  uint64_t v67;
  unint64_t v68;
  void *v69[2];
  __int128 v70;
  int v71;
  uint64_t v72[19];
  void **__dst;
  size_t v74;
  int64_t v75;
  _BYTE buf[24];
  _QWORD v77[3];
  uint64_t v78;
  unint64_t v79;
  __int128 __p;
  __int128 v81;
  int v82;
  _QWORD v83[22];

  v83[19] = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  v72[0] = MEMORY[0x24BEDB858] + 104;
  v4 = MEMORY[0x24BEDB858] + 64;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  v64 = MEMORY[0x24BEDB858] + 64;
  v63[0] = v6;
  *(_QWORD *)((char *)v63 + *(_QWORD *)(v6 - 24)) = v7;
  v63[1] = 0;
  v8 = (std::ios_base *)((char *)v63 + *(_QWORD *)(v63[0] - 24));
  std::ios_base::init(v8, v65);
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[5];
  v64 = v5[4];
  *(_QWORD *)((char *)&v65[-1] + *(_QWORD *)(v64 - 24)) = v9;
  v63[0] = v5[1];
  *(_QWORD *)((char *)v63 + *(_QWORD *)(v63[0] - 24)) = v5[6];
  v72[0] = v3;
  v63[0] = v2 + 24;
  v64 = v4;
  std::streambuf::basic_streambuf();
  v10 = MEMORY[0x24BEDB848];
  v65[0] = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)v69 = 0u;
  v70 = 0u;
  v71 = 24;
  v11 = *(unint64_t **)(*(_QWORD *)(a1 + 32) + 8);
  v12 = MEMORY[0x24BEDB870];
  v13 = MEMORY[0x24BEDB870] + 64;
  v14 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v15 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v83[0] = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)buf = v14;
  *(_QWORD *)&buf[*(_QWORD *)(v14 - 24)] = v15;
  v16 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
  std::ios_base::init(v16, &buf[8]);
  v16[1].__vftable = 0;
  v16[1].__fmtflags_ = -1;
  *(_QWORD *)buf = v12 + 24;
  v83[0] = v13;
  std::streambuf::basic_streambuf();
  *(_QWORD *)&buf[8] = v10 + 16;
  __p = 0u;
  v81 = 0u;
  v82 = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"{\n  mNumChannels: ", 18);
  v17 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"\n  mRecordingDurationInSecs: ", 29);
  v18 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"\n  mSampleRate: ", 16);
  v19 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"\n  mBytesPerSample: ", 20);
  v20 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"\n  mBufferLengthInSamples: ", 27);
  v21 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"\n  mNextWritePos: ", 18);
  v22 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"\n  mSamplesCount: ", 18);
  v23 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"\n  mMemoryPool(", 15);
  v24 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"): [", 4);
  if (*v11)
  {
    v25 = 0;
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"\n    chan-", 10);
      v26 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)": ", 2);
      v27 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)": sz=", 5);
      v28 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)": mem-sz: ", 10);
      std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"\n", 1);
      ++v25;
    }
    while (v25 < *v11);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"\n ]\n}\n", 6);
  v29 = MEMORY[0x24BEDB848];
  v30 = (_QWORD *)MEMORY[0x24BEDB800];
  if ((v82 & 0x10) != 0)
  {
    v33 = *((_QWORD *)&v81 + 1);
    if (*((_QWORD *)&v81 + 1) < v79)
    {
      *((_QWORD *)&v81 + 1) = v79;
      v33 = v79;
    }
    v34 = (const void **)&v78;
  }
  else
  {
    if ((v82 & 8) == 0)
    {
      v31 = 0;
      HIBYTE(v75) = 0;
      p_dst = (void **)&__dst;
      goto LABEL_19;
    }
    v34 = (const void **)v77;
    v33 = v77[2];
  }
  v35 = *v34;
  v31 = v33 - (_QWORD)*v34;
  if (v31 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v31 >= 0x17)
  {
    v36 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17)
      v36 = v31 | 7;
    v37 = v36 + 1;
    p_dst = (void **)operator new(v36 + 1);
    v74 = v31;
    v75 = v37 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_18;
  }
  HIBYTE(v75) = v33 - *(_BYTE *)v34;
  p_dst = (void **)&__dst;
  if (v31)
LABEL_18:
    memmove(p_dst, v35, v31);
LABEL_19:
  *((_BYTE *)p_dst + v31) = 0;
  if (v75 >= 0)
    v38 = (void **)&__dst;
  else
    v38 = __dst;
  if (v75 >= 0)
    v39 = HIBYTE(v75);
  else
    v39 = v74;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v64, (uint64_t)v38, v39);
  if (SHIBYTE(v75) < 0)
    operator delete(__dst);
  *(_QWORD *)buf = *v30;
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v30[3];
  *(_QWORD *)&buf[8] = v29 + 16;
  if (SBYTE7(v81) < 0)
    operator delete((void *)__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BAC9A8](v83);
  v40 = (void *)MEMORY[0x24BDD17C8];
  if ((v71 & 0x10) != 0)
  {
    v44 = *((_QWORD *)&v70 + 1);
    if (*((_QWORD *)&v70 + 1) < v68)
    {
      *((_QWORD *)&v70 + 1) = v68;
      v44 = v68;
    }
    v45 = (const void **)&v67;
  }
  else
  {
    if ((v71 & 8) == 0)
    {
      v41 = 0;
      buf[23] = 0;
      v42 = buf;
      v43 = (_QWORD *)MEMORY[0x24BEDB7F0];
      goto LABEL_44;
    }
    v45 = (const void **)v66;
    v44 = v66[2];
  }
  v46 = *v45;
  v41 = v44 - (_QWORD)*v45;
  if (v41 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v43 = (_QWORD *)MEMORY[0x24BEDB7F0];
  if (v41 >= 0x17)
  {
    v47 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v41 | 7) != 0x17)
      v47 = v41 | 7;
    v48 = v47 + 1;
    v42 = operator new(v47 + 1);
    *(_QWORD *)&buf[8] = v41;
    *(_QWORD *)&buf[16] = v48 | 0x8000000000000000;
    *(_QWORD *)buf = v42;
    goto LABEL_43;
  }
  buf[23] = v44 - *(_BYTE *)v45;
  v42 = buf;
  if (v41)
LABEL_43:
    memmove(v42, v46, v41);
LABEL_44:
  v42[v41] = 0;
  if (buf[23] >= 0)
    v49 = buf;
  else
    v49 = *(_BYTE **)buf;
  objc_msgSend(v40, "stringWithCString:encoding:", v49, 4, v65);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  v51 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v50;
    _os_log_impl(&dword_20D965000, v51, OS_LOG_TYPE_DEFAULT, "csrb: %{public}@", buf, 0xCu);
  }
  voicetrigger::VTAudioCircularBufferImpl<unsigned short>::copySamples((uint64_t *)&__dst, *(uint64_t **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v52 = __dst;
  v53 = VTLogContextFacilityVoiceTrigger;
  if (__dst)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v54 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v55 = *(_QWORD *)(v54 + 40);
      v58 = v54 + 16;
      v56 = *(_QWORD *)(v54 + 16);
      v57 = *(_QWORD *)(v58 + 8);
      *(_DWORD *)buf = 134349568;
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2050;
      v77[0] = v56;
      _os_log_impl(&dword_20D965000, v53, OS_LOG_TYPE_DEFAULT, "mBufferLen:  %{public}lu, samplesCount=%{public}lu, sampleRate=%{public}lu", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "addSamples:len:", v52, *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "close");
    MEMORY[0x212BAC9C0](v52, 0x1000C80BDFB0063);
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v61 = *(_QWORD *)(a1 + 48);
    v62 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134349312;
    *(_QWORD *)&buf[4] = v61;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v62;
    _os_log_error_impl(&dword_20D965000, v53, OS_LOG_TYPE_ERROR, "Invalid request: (%{public}lu, %{public}lu): noting to write to file", buf, 0x16u);
  }

  v63[0] = *v43;
  v59 = v43[9];
  *(_QWORD *)((char *)v63 + *(_QWORD *)(v63[0] - 24)) = v43[8];
  v64 = v59;
  v65[0] = v29 + 16;
  if (SBYTE7(v70) < 0)
    operator delete(v69[0]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BAC9A8](v72);
}

void __67__VTAudioCircularBuffer_copySamplesFrom_to_withNumSamplesCopiedIn___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  voicetrigger::VTAudioCircularBufferImpl<unsigned short>::copySamples(&v13, *(uint64_t **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = v13;
  if (v13)
  {
    v3 = *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v13, 2 * **(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) * v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    **(_QWORD **)(a1 + 64) = v3;
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134349568;
      v15 = v8;
      v16 = 2050;
      v17 = v9;
      v18 = 2050;
      v19 = v3;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x20u);
    }
    MEMORY[0x212BAC9C0](v2, 0x1000C80BDFB0063);
  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134349312;
      v15 = v11;
      v16 = 2050;
      v17 = v12;
      _os_log_error_impl(&dword_20D965000, v10, OS_LOG_TYPE_ERROR, "Could not copyFrom:%{public}lu to: %{public}lu", buf, 0x16u);
    }
    **(_QWORD **)(a1 + 64) = 0;
  }
}

_QWORD *__47__VTAudioCircularBuffer_addSamples_numSamples___block_invoke(_QWORD *result)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t __n;

  v1 = *(unint64_t **)(result[4] + 8);
  v2 = result[6];
  v3 = v1[3];
  if (*v1)
  {
    v4 = (char *)result[5];
    v18 = v2 - v3;
    v20 = result[6];
    __n = 2 * v2;
    if (v2 >= v3)
    {
      v12 = 0;
      v13 = &v4[2 * v2];
      v14 = (char *)result[5];
      do
      {
        v16 = v1[4];
        v17 = *(char **)(v1[7] + 8 * v12);
        if (v3 - v16 < v2)
        {
          v10 = (v16 + v18) % v3;
          v19 = (uint64_t)&v4[2 * v12 * v2 + 2 * v18];
          memcpy(&v17[2 * v10], &v13[-2 * v3], 2 * (v3 - v10));
          result = memcpy(v17, (const void *)(v19 + 2 * (v3 - v10)), 2 * v10);
          v2 = v20;
          v15 = __n;
        }
        else
        {
          result = memcpy(&v17[2 * v16], v14, __n);
          v2 = v20;
          v15 = __n;
          v10 = v16 + v20;
        }
        ++v12;
        v13 += v15;
        v14 += v15;
      }
      while (v12 < *v1);
    }
    else
    {
      v5 = 0;
      do
      {
        v7 = v1[4];
        v8 = *(char **)(v1[7] + 8 * v5);
        v9 = &v8[2 * v7];
        v10 = v2 - (v3 - v7);
        if (v2 > v3 - v7)
        {
          memcpy(v9, v4, 2 * (v3 - v7));
          result = memcpy(v8, &v4[2 * v3 - 2 * v7], 2 * v10);
          v2 = v20;
          v6 = __n;
        }
        else
        {
          result = memcpy(v9, v4, __n);
          v2 = v20;
          v6 = __n;
          v10 = v7 + v20;
        }
        ++v5;
        v4 += v6;
      }
      while (v5 < *v1);
    }
  }
  else
  {
    v10 = v1[4];
  }
  v11 = v1[5] + v2;
  v1[4] = v10 % v3;
  v1[5] = v11;
  return result;
}

@end
