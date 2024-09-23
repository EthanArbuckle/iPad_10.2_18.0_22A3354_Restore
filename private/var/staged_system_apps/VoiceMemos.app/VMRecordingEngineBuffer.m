@implementation VMRecordingEngineBuffer

- (AVAudioTime)audioTime
{
  return self->_audioTime;
}

- (void)setAudioTime:(id)a3
{
  objc_storeStrong((id *)&self->_audioTime, a3);
}

- (AVAudioPCMBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_audioBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_audioTime, 0);
}

@end
