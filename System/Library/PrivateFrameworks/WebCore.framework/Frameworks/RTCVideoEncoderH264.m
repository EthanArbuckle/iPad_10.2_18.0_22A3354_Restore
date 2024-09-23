@implementation RTCVideoEncoderH264

uint64_t __149__RTCVideoEncoderH264_frameWasEncoded_flags_sampleBuffer_codecSpecificInfo_width_height_renderTimeMs_timestamp_duration_rotation_isKeyFrameRequired___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;
    if (v3)
      MEMORY[0x20BD0ADD4](v3, 0x1000C8077774924);
    JUMPOUT(0x20BD0ADECLL);
  }
  return result;
}

@end
