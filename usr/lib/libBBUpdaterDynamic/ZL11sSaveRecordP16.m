@implementation ZL11sSaveRecordP16

const char *___ZL11sSaveRecordP16_BBUFSServer_tagPKcPK28ETLSAHDebugDataFieldRecord_t_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _BBUFSDebugPrint("sHandleCapureProgress", "%s:  %0.1f%c\n", a3, a4, a5, a6, a7, a8, a3 + 32);
}

const char *___ZL11sSaveRecordP16_BBUFSServer_tagPKcjjj_block_invoke(const char *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (100 * a2 / a3 > _ZZZL11sSaveRecordP16_BBUFSServer_tagPKcjjjEUb_E19prev_update_percent + 10)
  {
    _ZZZL11sSaveRecordP16_BBUFSServer_tagPKcjjjEUb_E19prev_update_percent = 100 * a2 / a3;
    return _BBUFSDebugPrint("sHandleCapureProgress", "%s:  %0.1f%c\n", a3, a4, a5, a6, a7, a8, *((_QWORD *)result + 4));
  }
  return result;
}

@end
