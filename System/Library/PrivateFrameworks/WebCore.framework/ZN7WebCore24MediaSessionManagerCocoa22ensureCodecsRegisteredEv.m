@implementation ZN7WebCore24MediaSessionManagerCocoa22ensureCodecsRegisteredEv

WebCore *___ZN7WebCore24MediaSessionManagerCocoa22ensureCodecsRegisteredEv_block_invoke(WebCore *result)
{
  if (WebCore::PlatformMediaSessionManager::m_vp9DecoderEnabled)
    result = (WebCore *)WebCore::registerSupplementalVP9Decoder(result);
  if (WebCore::PlatformMediaSessionManager::m_swVPDecodersAlwaysEnabled)
  {
    result = (WebCore *)webrtc::registerWebKitVP9Decoder(result);
  }
  else if (!WebCore::PlatformMediaSessionManager::m_vp8DecoderEnabled)
  {
    return result;
  }
  return (WebCore *)WebCore::LibWebRTCProvider::registerWebKitVP8Decoder(result);
}

@end
