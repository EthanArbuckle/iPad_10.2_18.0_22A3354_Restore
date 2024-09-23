@implementation _LTSpeechCompressor

- (_LTSpeechCompressor)initWithDelegate:(id)a3
{
  id v4;
  _LTSpeechCompressor *v5;
  _LTSpeechCompressor *v6;
  _LTSpeechCompressor *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LTSpeechCompressor;
  v5 = -[_LTSpeechCompressor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_LTSpeechCompressor reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)_LTSpeechCompressor;
  -[_LTSpeechCompressor dealloc](&v3, sel_dealloc);
}

- (void)startCompressionNarrowband:(BOOL)a3
{
  double v4;
  UInt32 v5;
  NSMutableData *v6;
  NSMutableData *bufferedAudio;
  int inPropertyData;
  AudioStreamBasicDescription inDestinationFormat;
  AudioStreamBasicDescription inSourceFormat;

  v4 = 16000.0;
  if (a3)
    v4 = 8000.0;
  inSourceFormat.mSampleRate = v4;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_2493387F0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_249338800;
  inDestinationFormat.mSampleRate = v4;
  *(_QWORD *)&inDestinationFormat.mFormatID = 1869641075;
  if (a3)
    v5 = 160;
  else
    v5 = 320;
  inDestinationFormat.mBytesPerPacket = 0;
  inDestinationFormat.mFramesPerPacket = v5;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_249338810;
  AudioConverterNew(&inSourceFormat, &inDestinationFormat, &self->_audioConverter);
  inPropertyData = 32000;
  AudioConverterSetProperty(self->_audioConverter, 0x62726174u, 4u, &inPropertyData);
  v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = v6;

}

- (void)reset
{
  OpaqueAudioConverter *audioConverter;
  NSMutableData *bufferedAudio;

  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    AudioConverterDispose(audioConverter);
    self->_audioConverter = 0;
  }
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = 0;

  self->_packetIndex = 0;
  self->_bytesConsumed = 0;
}

- (void)addAudioSampleData:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  OpaqueAudioConverter *v6;
  unint64_t v7;
  AudioStreamPacketDescription *p_outPacketDescription;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD inInputDataProcUserData[4];
  id v13;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  id location;
  AudioStreamPacketDescription outPacketDescription;
  char v18;
  uint64_t v19;

  v3 = MEMORY[0x24BDAC7A8](self, a2, a3);
  v19 = *MEMORY[0x24BDAC8D0];
  v11 = v4;
  objc_msgSend(*(id *)(v3 + 24), "appendData:");
  objc_initWeak(&location, (id)v3);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  while (1)
  {
    *(&outOutputData.mNumberBuffers + 1) = 0;
    outOutputData.mBuffers[0].mData = &v18;
    *(_QWORD *)&outOutputData.mBuffers[0].mNumberChannels = 0x200000000001;
    ioOutputDataPacketSize = 10;
    outOutputData.mNumberBuffers = 1;
    v6 = *(OpaqueAudioConverter **)(v3 + 16);
    inInputDataProcUserData[0] = MEMORY[0x24BDAC760];
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = __42___LTSpeechCompressor_addAudioSampleData___block_invoke;
    inInputDataProcUserData[3] = &unk_251A139B8;
    objc_copyWeak(&v13, &location);
    if (AudioConverterFillComplexBuffer(v6, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke_0, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, &outPacketDescription))
    {
      break;
    }
    if (ioOutputDataPacketSize)
    {
      v7 = 0;
      p_outPacketDescription = &outPacketDescription;
      do
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)outOutputData.mBuffers[0].mData + p_outPacketDescription->mStartOffset, p_outPacketDescription->mDataByteSize);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);
        ++*(_QWORD *)(v3 + 32);

        ++p_outPacketDescription;
        ++v7;
      }
      while (v7 < ioOutputDataPacketSize);
    }
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&v13);
  objc_msgSend(*(id *)(v3 + 24), "replaceBytesInRange:withBytes:length:", 0, *(_QWORD *)(v3 + 40), 0, 0);
  *(_QWORD *)(v3 + 40) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
  objc_msgSend(WeakRetained, "didCompressPackets:totalPacketCount:", v5, *(_QWORD *)(v3 + 32));

  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedAudio, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
