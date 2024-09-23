@implementation VSSpeechSynthesisCallbackResult

- (VSSpeechSynthesisCallbackResult)initWithCallback:(id)a3
{
  id v4;
  VSSpeechSynthesisCallbackResult *v5;
  uint64_t v6;
  id callback;
  NSMutableArray *v8;
  NSMutableArray *wordTimings;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSSpeechSynthesisCallbackResult;
  v5 = -[VSSpeechSynthesisCallbackResult init](&v11, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1DF0E94A4](v4);
    callback = v5->_callback;
    v5->_callback = (id)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    wordTimings = v5->_wordTimings;
    v5->_wordTimings = v8;

  }
  return v5;
}

- (int)synthesisCallback:(int)a3
{
  NSError *v4;
  NSError *error;
  Marker *end;
  Marker *begin;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *value;
  unint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  char v22;
  Marker *v23;
  Marker *v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  Marker *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  Marker *v34;
  Marker *v35;
  Marker *v36;
  Marker *v37;
  Marker *v38;
  Marker *v39;
  __int128 v40;
  __int128 v41;
  Marker *v42;
  Marker *v43;
  Marker *v44;
  NSError *v45;
  NSError *v46;
  id callback;
  NSError *v48;
  NSError *v49;
  unint64_t v50;
  Marker *v52;
  unsigned int v53;
  __int128 v54;
  __int128 v55;
  std::string __p;

  switch(a3)
  {
    case 0:
      self->_state = 1;
      self->_lastUTF8Offset = 0;
      self->_lastUTF16Offset = 0;
      self->_samplesProcessed = 0;
      (*((void (**)(void))self->_callback + 2))();
      v4 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v4;

      -[NSMutableArray removeAllObjects](self->_wordTimings, "removeAllObjects");
      return self->_error != 0;
    case 1:
      self->_state = 3;
      (*((void (**)(void))self->_callback + 2))();
      v45 = (NSError *)objc_claimAutoreleasedReturnValue();
      v46 = self->_error;
      self->_error = v45;

      callback = self->_callback;
      self->_callback = 0;

      return self->_error != 0;
    case 4:
      self->_state = 2;
      if (self->_stopMark == 1)
      {
        begin = self->_markers.__begin_;
        end = self->_markers.__end_;
        if (begin != end)
        {
          v52 = self->_markers.__end_;
          do
          {
            v8 = *(_OWORD *)&begin->markerName[10];
            v54 = *(_OWORD *)&begin->id;
            v55 = v8;
            if ((char)begin->markerName[49] < 0)
            {
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&begin->markerName[26], *(_QWORD *)&begin->markerName[34]);
            }
            else
            {
              v9 = *(_OWORD *)&begin->markerName[26];
              __p.__r_.__value_.__r.__words[2] = *(_QWORD *)&begin->markerName[42];
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
            }
            if ((_DWORD)v54)
              goto LABEL_10;
            v10 = *((_QWORD *)&v55 + 1);
            -[VSSpeechSynthesisCallbackResult asbd](self, "asbd");
            v11 = v10 * v53;
            v12 = self->_samples.__begin_;
            v13 = self->_samples.__end_;
            if (v11 <= v13 - v12)
            {
              v21 = 0uLL;
              if (v11 < v13 - v12)
                self->_samples.__end_ = &v12[v11];
              goto LABEL_33;
            }
            value = self->_samples.__end_cap_.__value_;
            if (value - v13 >= v11 - (v13 - v12))
            {
              bzero(self->_samples.__end_, v11 - (v13 - v12));
              self->_samples.__end_ = &v12[v11];
            }
            else
            {
              if ((v11 & 0x8000000000000000) != 0)
                std::vector<TTSSynthesizer::Marker>::__throw_length_error[abi:ne180100]();
              v15 = value - v12;
              v16 = 2 * v15;
              if (2 * v15 <= v11)
                v16 = v11;
              if (v15 >= 0x3FFFFFFFFFFFFFFFLL)
                v17 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v17 = v16;
              v18 = (char *)operator new(v17);
              v19 = &v18[v13 - v12];
              bzero(v19, v11 - (v13 - v12));
              if (v13 == v12)
              {
                v21 = 0uLL;
              }
              else
              {
                v20 = &v13[~(unint64_t)v12];
                v21 = 0uLL;
                do
                {
                  v22 = *--v13;
                  (v20--)[(_QWORD)v18] = v22;
                }
                while (v13 != v12);
                v13 = self->_samples.__begin_;
                v19 = v18;
              }
              self->_samples.__begin_ = v19;
              self->_samples.__end_ = &v18[v11];
              self->_samples.__end_cap_.__value_ = &v18[v17];
              if (!v13)
                goto LABEL_33;
              operator delete(v13);
            }
            v21 = 0uLL;
LABEL_33:
            v23 = self->_markers.__begin_;
            v24 = self->_markers.__end_;
            v25 = 0x6DB6DB6DB6DB6DB7 * (((char *)&v54 - (char *)v23) >> 3) + 1;
            v26 = 0x6DB6DB6DB6DB6DB7 * (((char *)v24 - (char *)v23) >> 3);
            v27 = v25 >= v26;
            v28 = v25 - v26;
            if (v25 <= v26)
            {
              end = v52;
              if (!v27)
              {
                v43 = (Marker *)((char *)v23 + 56 * v25);
                while (v24 != v43)
                {
                  if ((char)v24[-1].markerName[255] < 0)
                    operator delete(*(void **)&v24[-1].markerName[232]);
                  v24 = (Marker *)((char *)v24 - 56);
                }
                self->_markers.__end_ = v43;
              }
              goto LABEL_10;
            }
            v29 = self->_markers.__end_cap_.__value_;
            if (0x6DB6DB6DB6DB6DB7 * (((char *)v29 - (char *)v24) >> 3) >= v28)
            {
              v44 = (Marker *)((char *)v24 + 56 * v28);
              end = v52;
              do
              {
                *(_QWORD *)&v24->markerName[42] = 0;
                *(_OWORD *)&v24->markerName[10] = v21;
                *(_OWORD *)&v24->markerName[26] = v21;
                *(_OWORD *)&v24->id = v21;
                v24->markerName[49] = 1;
                v24 = (Marker *)((char *)v24 + 56);
              }
              while (v24 != v44);
              self->_markers.__end_ = v44;
              goto LABEL_10;
            }
            if (v25 > 0x492492492492492)
              std::vector<TTSSynthesizer::Marker>::__throw_length_error[abi:ne180100]();
            v30 = 0x6DB6DB6DB6DB6DB7 * (((char *)v29 - (char *)v23) >> 3);
            v31 = 2 * v30;
            if (2 * v30 <= v25)
              v31 = v25;
            if (v30 >= 0x249249249249249)
              v32 = 0x492492492492492;
            else
              v32 = v31;
            if (v32 > 0x492492492492492)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v33 = (char *)operator new(56 * v32);
            v34 = (Marker *)&v33[56 * v26];
            v35 = (Marker *)&v33[56 * v25];
            v36 = v34;
            do
            {
              *(_QWORD *)&v36->markerName[42] = 0;
              *(_OWORD *)&v36->markerName[10] = 0uLL;
              *(_OWORD *)&v36->markerName[26] = 0uLL;
              *(_OWORD *)&v36->id = 0uLL;
              v36->markerName[49] = 1;
              v36 = (Marker *)((char *)v36 + 56);
            }
            while (v36 != v35);
            v37 = (Marker *)&v33[56 * v32];
            v38 = self->_markers.__begin_;
            v39 = self->_markers.__end_;
            end = v52;
            if (v39 != v38)
            {
              do
              {
                v40 = *(_OWORD *)&v39[-1].markerName[200];
                *(_OWORD *)&v34[-1].markerName[216] = *(_OWORD *)&v39[-1].markerName[216];
                *(_OWORD *)&v34[-1].markerName[200] = v40;
                v41 = *(_OWORD *)&v39[-1].markerName[232];
                *(_QWORD *)&v34[-1].markerName[248] = *(_QWORD *)&v39[-1].markerName[248];
                *(_OWORD *)&v34[-1].markerName[232] = v41;
                v34 = (Marker *)((char *)v34 - 56);
                *(_QWORD *)&v39[-1].markerName[240] = 0;
                *(_QWORD *)&v39[-1].markerName[248] = 0;
                *(_QWORD *)&v39[-1].markerName[232] = 0;
                v39 = (Marker *)((char *)v39 - 56);
              }
              while (v39 != v38);
              v42 = self->_markers.__begin_;
              v39 = self->_markers.__end_;
              self->_markers.__begin_ = v34;
              self->_markers.__end_ = v35;
              self->_markers.__end_cap_.__value_ = v37;
              if (v39 != v42)
              {
                do
                {
                  if ((char)v39[-1].markerName[255] < 0)
                    operator delete(*(void **)&v39[-1].markerName[232]);
                  v39 = (Marker *)((char *)v39 - 56);
                }
                while (v39 != v42);
                v39 = v42;
              }
              if (!v39)
                goto LABEL_10;
LABEL_64:
              operator delete(v39);
              goto LABEL_10;
            }
            self->_markers.__begin_ = v34;
            self->_markers.__end_ = v35;
            self->_markers.__end_cap_.__value_ = v37;
            if (v39)
              goto LABEL_64;
LABEL_10:
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            begin = (Marker *)((char *)begin + 56);
          }
          while (begin != end);
        }
      }
      (*((void (**)(void))self->_callback + 2))();
      v48 = (NSError *)objc_claimAutoreleasedReturnValue();
      v49 = self->_error;
      self->_error = v48;

      v50 = self->_samples.__end_ - self->_samples.__begin_;
      -[VSSpeechSynthesisCallbackResult asbd](self, "asbd");
      self->_samplesProcessed += v50 / DWORD2(v55);
      self->_samples.__end_ = self->_samples.__begin_;
      return self->_error != 0;
    case 5:
      -[VSSpeechSynthesisCallbackResult processMarkerBuffer](self, "processMarkerBuffer");
      std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100]((uint64_t *)&self->_markers);
      return self->_error != 0;
    default:
      return self->_error != 0;
  }
}

- (id)pcmData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_samples.__begin_, self->_samples.__end_ - self->_samples.__begin_, 0);
}

- (id)mutablePCMData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", self->_samples.__begin_, self->_samples.__end_ - self->_samples.__begin_, 0);
}

- (void)sampleBuffer
{
  return &self->_samples;
}

- (void)markerBuffer
{
  return &self->_markers;
}

- (unint64_t)utf8BytesForChar:(unsigned __int16)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 1;
  v4 = 2;
  if (a3 >= 0x7FFu)
    v4 = 3;
  if (a3 >= 0x7Fu)
    v3 = v4;
  if ((a3 & 0xF800) == 0xD800)
    return 2;
  else
    return v3;
}

- (unint64_t)utf16OffsetFromUTF8:(unint64_t)a3
{
  unint64_t lastUTF8Offset;
  BOOL v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  NSString *v10;
  unint64_t v11;
  unint64_t lastUTF16Offset;
  NSString *text;
  unint64_t v15;

  lastUTF8Offset = self->_lastUTF8Offset;
  v6 = lastUTF8Offset > a3;
  if (lastUTF8Offset >= a3)
  {
    while (v6)
    {
      lastUTF16Offset = self->_lastUTF16Offset;
      if (!lastUTF16Offset)
        break;
      text = self->_text;
      self->_lastUTF16Offset = lastUTF16Offset - 1;
      v15 = self->_lastUTF8Offset
          - -[VSSpeechSynthesisCallbackResult utf8BytesForChar:](self, "utf8BytesForChar:", -[NSString characterAtIndex:](text, "characterAtIndex:"));
      self->_lastUTF8Offset = v15;
      v6 = v15 > a3;
    }
  }
  else
  {
    v7 = -[NSString length](self->_text, "length");
    if (self->_lastUTF8Offset < a3)
    {
      v8 = v7;
      do
      {
        v9 = self->_lastUTF16Offset;
        if (v9 >= v8)
          break;
        v10 = self->_text;
        self->_lastUTF16Offset = v9 + 1;
        v11 = self->_lastUTF8Offset
            + -[VSSpeechSynthesisCallbackResult utf8BytesForChar:](self, "utf8BytesForChar:", -[NSString characterAtIndex:](v10, "characterAtIndex:"));
        self->_lastUTF8Offset = v11;
      }
      while (v11 < a3);
    }
  }
  return self->_lastUTF16Offset;
}

- (void)processMarkerBuffer
{
  Marker *begin;
  Marker *end;
  unsigned __int8 *v5;
  VSSpeechWordTimingInfo *v6;
  unint64_t v7;
  unsigned __int8 *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  std::string __p;

  begin = self->_markers.__begin_;
  end = self->_markers.__end_;
  if (begin != end)
  {
    v5 = &begin->markerName[26];
    do
    {
      v10 = *((_OWORD *)v5 - 2);
      v11 = *((_OWORD *)v5 - 1);
      if ((char)v5[23] < 0)
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      else
        __p = *(std::string *)v5;
      if ((_DWORD)v10 == 2)
      {
        ++self->_numOfPromptsTriggered;
      }
      else if (!(_DWORD)v10)
      {
        v6 = objc_alloc_init(VSSpeechWordTimingInfo);
        -[VSSpeechSynthesisCallbackResult asbd](self, "asbd");
        -[VSSpeechWordTimingInfo setStartTime:](v6, "setStartTime:", (double)*((unint64_t *)&v11 + 1) / v9);
        v7 = -[VSSpeechSynthesisCallbackResult utf16OffsetFromUTF8:](self, "utf16OffsetFromUTF8:", *((_QWORD *)&v10 + 1));
        -[VSSpeechWordTimingInfo setTextRange:](v6, "setTextRange:", v7, -[VSSpeechSynthesisCallbackResult utf16OffsetFromUTF8:](self, "utf16OffsetFromUTF8:", (_QWORD)v11 + *((_QWORD *)&v10 + 1))- v7);
        -[NSMutableArray addObject:](self->_wordTimings, "addObject:", v6);

      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v8 = v5 - 32;
      v5 += 56;
    }
    while (v8 + 56 != (unsigned __int8 *)end);
  }
}

- (id)wordTimingInfos
{
  return self->_wordTimings;
}

- (void)phonemeBuffer
{
  return &self->_phonemeBuffer;
}

- (id)phonemes
{
  void *v3;
  _QWORD *begin;
  _QWORD *i;
  _QWORD *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  begin = self->_phonemeBuffer.__begin_;
  for (i = self->_phonemeBuffer.__end_; begin != i; begin += 3)
  {
    v6 = begin;
    if (*((char *)begin + 23) < 0)
      v6 = (_QWORD *)*begin;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)numOfPromptsTriggered
{
  return self->_numOfPromptsTriggered;
}

- (void)setNumOfPromptsTriggered:(unint64_t)a3
{
  self->_numOfPromptsTriggered = a3;
}

- (BOOL)neuralDidFallback
{
  return self->_neuralDidFallback;
}

- (void)setNeuralDidFallback:(BOOL)a3
{
  self->_neuralDidFallback = a3;
}

- (BOOL)hasAlignmentStall
{
  return self->_hasAlignmentStall;
}

- (void)setHasAlignmentStall:(BOOL)a3
{
  self->_hasAlignmentStall = a3;
}

- (BOOL)hasAudioClick
{
  return self->_hasAudioClick;
}

- (void)setHasAudioClick:(BOOL)a3
{
  self->_hasAudioClick = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (int64_t)stopMark
{
  return self->_stopMark;
}

- (void)setStopMark:(int64_t)a3
{
  self->_stopMark = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSMutableArray)wordTimings
{
  return self->_wordTimings;
}

- (void)setWordTimings:(id)a3
{
  objc_storeStrong((id *)&self->_wordTimings, a3);
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[4].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[5].mSampleRate;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (unint64_t)samplesProcessed
{
  return self->_samplesProcessed;
}

- (void)setSamplesProcessed:(unint64_t)a3
{
  self->_samplesProcessed = a3;
}

- (unint64_t)lastUTF8Offset
{
  return self->_lastUTF8Offset;
}

- (void)setLastUTF8Offset:(unint64_t)a3
{
  self->_lastUTF8Offset = a3;
}

- (unint64_t)lastUTF16Offset
{
  return self->_lastUTF16Offset;
}

- (void)setLastUTF16Offset:(unint64_t)a3
{
  self->_lastUTF16Offset = a3;
}

- (void).cxx_destruct
{
  void **begin;
  void **end;
  void *v5;
  char *v6;

  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_error, 0);
  begin = (void **)self->_phonemeBuffer.__begin_;
  if (begin)
  {
    end = (void **)self->_phonemeBuffer.__end_;
    v5 = self->_phonemeBuffer.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0)
          operator delete(*(end - 3));
        end -= 3;
      }
      while (end != begin);
      v5 = self->_phonemeBuffer.__begin_;
    }
    self->_phonemeBuffer.__end_ = begin;
    operator delete(v5);
  }
  if (self->_markers.__begin_)
  {
    std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100]((uint64_t *)&self->_markers);
    operator delete(self->_markers.__begin_);
  }
  v6 = self->_samples.__begin_;
  if (v6)
  {
    self->_samples.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
