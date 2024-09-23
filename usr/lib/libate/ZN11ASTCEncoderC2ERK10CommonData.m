@implementation ZN11ASTCEncoderC2ERK10CommonData

void *___ZN11ASTCEncoderC2ERK10CommonData_block_invoke()
{
  void *v0;
  void *result;

  v0 = dlopen("/System/Library/Frameworks/Accelerate.framework/Accelerate", 261);
  if (!v0)
  {
    result = _vDSP_meanv;
    if (_vDSP_meanv)
      goto LABEL_4;
    goto LABEL_3;
  }
  result = dlsym(v0, "vDSP_meanv");
  _vDSP_meanv = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))result;
  if (!result)
LABEL_3:
    _vDSP_meanv = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))my_meanv;
LABEL_4:
  kAlphaProcs4x4 = (uint64_t)PassThrough_4x4_vec;
  unk_253D0B6A0 = FlattenNon_4x4_vec;
  qword_253D0B6A8 = (uint64_t)Premultiply_4x4_vec;
  unk_253D0B6B0 = SetAlphaOne_4x4_vec;
  qword_253D0B6B8 = (uint64_t)SetAlphaOne_4x4_vec;
  unk_253D0B6C0 = SetAlphaOne_4x4_vec;
  qword_253D0B6C8 = (uint64_t)Unpremultiply_4x4_vec;
  unk_253D0B6D0 = FlattenPre_4x4_vec;
  qword_253D0B6D8 = (uint64_t)ClampPremultiplied_4x4_vec;
  kAlphaProcs8x8 = (uint64_t)PassThrough_8x8_vec;
  unk_253D0B730 = FlattenNon_8x8_vec;
  qword_253D0B738 = (uint64_t)Premultiply_8x8_vec;
  unk_253D0B740 = SetAlphaOne_8x8_vec;
  qword_253D0B748 = (uint64_t)SetAlphaOne_8x8_vec;
  unk_253D0B750 = SetAlphaOne_8x8_vec;
  qword_253D0B758 = (uint64_t)Unpremultiply_8x8_vec;
  unk_253D0B760 = FlattenPre_8x8_vec;
  qword_253D0B768 = (uint64_t)ClampPremultiplied_8x8_vec;
  kEncodeProcs4x4 = (uint64_t)EncodeASTC_4x4_RGBA_vec;
  kEncodeProcs8x8 = (uint64_t)&EncodeASTC_8x8_RGBA_vec;
  kDecodeProcs = (uint64_t)DecodeASTC_RGBA_vec;
  kReadProcs4x4 = (uint64_t)Read_4x4_R8_vec;
  unk_253D0B5B0 = Read_4x4_RA8_vec;
  qword_253D0B5B8 = (uint64_t)Read_4x4_RGBA8_vec;
  unk_253D0B5C0 = Read_4x4_BGRA8_vec;
  qword_253D0B5C8 = (uint64_t)Read_4x4_R16_vec;
  unk_253D0B5D0 = Read_4x4_RA16_vec;
  qword_253D0B5D8 = (uint64_t)Read_4x4_RGBA16_vec;
  unk_253D0B5E0 = Read_4x4_Rf16_vec;
  qword_253D0B5E8 = (uint64_t)Read_4x4_RAf16_vec;
  unk_253D0B5F0 = Read_4x4_RGBAf16_vec;
  kReadProcs8x8 = (uint64_t)Read_8x8_R8_vec;
  unk_253D0B650 = Read_8x8_RA8_vec;
  qword_253D0B658 = (uint64_t)Read_8x8_RGBA8_vec;
  unk_253D0B660 = Read_8x8_BGRA8_vec;
  qword_253D0B668 = (uint64_t)Read_8x8_R16_vec;
  unk_253D0B670 = Read_8x8_RA16_vec;
  qword_253D0B678 = (uint64_t)Read_8x8_RGBA16_vec;
  unk_253D0B680 = Read_8x8_Rf16_vec;
  qword_253D0B688 = (uint64_t)Read_8x8_RAf16_vec;
  unk_253D0B690 = Read_8x8_RGBAf16_vec;
  kWriteProcs = (uint64_t)Write_R8_vec;
  *(_QWORD *)algn_253D0B508 = Write_RA8_vec;
  qword_253D0B510 = (uint64_t)Write_RGBA8_vec;
  unk_253D0B518 = Write_BGRA8_vec;
  qword_253D0B520 = (uint64_t)Write_R16_vec;
  unk_253D0B528 = Write_RA16_vec;
  qword_253D0B530 = (uint64_t)Write_RGBA16_vec;
  unk_253D0B538 = Write_Rf16_vec;
  qword_253D0B540 = (uint64_t)Write_RAf16_vec;
  unk_253D0B548 = Write_RGBAf16_vec;
  kTexelAlphaProcs = (uint64_t)PassThrough_vec;
  *(_QWORD *)algn_253D0B788 = FlattenNon_vec;
  qword_253D0B790 = (uint64_t)Premultiply_vec;
  unk_253D0B798 = SetAlphaOne_vec;
  qword_253D0B7A0 = (uint64_t)SetAlphaOne_vec;
  unk_253D0B7A8 = SetAlphaOne_vec;
  qword_253D0B7B0 = (uint64_t)Unpremultiply_vec;
  unk_253D0B7B8 = FlattenPre_vec;
  qword_253D0B7C0 = (uint64_t)ClampPremultiplied_vec;
  return result;
}

@end
