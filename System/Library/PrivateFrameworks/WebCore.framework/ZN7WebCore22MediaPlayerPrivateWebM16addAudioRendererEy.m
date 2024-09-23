@implementation ZN7WebCore22MediaPlayerPrivateWebM16addAudioRendererEy

_QWORD *___ZN7WebCore22MediaPlayerPrivateWebM16addAudioRendererEy_block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[5];
  if (v1)
  {
    if (*(_QWORD *)(v1 + 8))
      return WebCore::MediaPlayerPrivateWebM::didBecomeReadyForMoreSamples((_QWORD *)result[4], (WTF::String *)result[6]);
  }
  return result;
}

@end
