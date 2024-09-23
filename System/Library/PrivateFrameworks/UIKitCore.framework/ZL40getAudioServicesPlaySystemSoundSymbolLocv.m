@implementation ZL40getAudioServicesPlaySystemSoundSymbolLocv

void *___ZL40getAudioServicesPlaySystemSoundSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!qword_1ECD7A6F0)
    qword_1ECD7A6F0 = _sl_dlopen();
  v2 = (void *)qword_1ECD7A6F0;
  if (!qword_1ECD7A6F0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AudioToolboxLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("UIKBHandwritingView.mm"), 42, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "AudioServicesPlaySystemSound");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  _MergedGlobals_3_17 = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
