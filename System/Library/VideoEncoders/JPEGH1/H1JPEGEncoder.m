@implementation H1JPEGEncoder

uint64_t __H1JPEGEncoder_StartSession_block_invoke()
{
  uint64_t result;

  H1JPEGEncoder_StartSession_sRateControllerEnabled = FigGetCFPreferenceNumberWithDefault();
  H1JPEGEncoder_StartSession_sRateControllerMBitCap = FigGetCFPreferenceNumberWithDefault();
  result = FigGetCFPreferenceNumberWithDefault();
  H1JPEGEncoder_StartSession_sRateControllerWindowSizeFrames = result;
  return result;
}

@end
