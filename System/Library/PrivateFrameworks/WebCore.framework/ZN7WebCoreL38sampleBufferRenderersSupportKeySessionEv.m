@implementation ZN7WebCoreL38sampleBufferRenderersSupportKeySessionEv

PAL *___ZN7WebCoreL38sampleBufferRenderersSupportKeySessionEv_block_invoke(PAL *a1)
{
  PAL *result;
  BOOL v2;

  result = (PAL *)objc_msgSend((id)PAL::getAVSampleBufferAudioRendererClass(a1), "conformsToProtocol:", &unk_1EE350940);
  v2 = (_DWORD)result
    && (result = (PAL *)objc_msgSend((id)PAL::getAVSampleBufferDisplayLayerClass(result), "conformsToProtocol:", &unk_1EE350940), (_DWORD)result)&& WebCore::s_sampleBufferContentKeySessionSupportEnabled != 0;
  _MergedGlobals_110 = v2;
  return result;
}

@end
