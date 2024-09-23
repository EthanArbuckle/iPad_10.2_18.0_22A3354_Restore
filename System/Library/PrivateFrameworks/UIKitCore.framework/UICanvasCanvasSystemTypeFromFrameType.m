@implementation UICanvasCanvasSystemTypeFromFrameType

void ___UICanvasCanvasSystemTypeFromFrameType_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UIWindowSceneSessionRoleApplication");
  v2[1] = CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive");
  v3[0] = &unk_1E1A970E0;
  v3[1] = &unk_1E1A970F8;
  v2[2] = CFSTR("UIWindowSceneSessionRoleCarPlay");
  v2[3] = CFSTR("UIWindowSceneSessionTypeCoverSheet");
  v3[2] = &unk_1E1A97110;
  v3[3] = &unk_1E1A97128;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_980;
  _MergedGlobals_980 = v0;

}

@end
