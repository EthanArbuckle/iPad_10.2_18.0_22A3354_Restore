@implementation UpdateSystemSoundActiveStatus

void __UpdateSystemSoundActiveStatus_block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = *(unsigned __int8 *)(a1 + 32);
  if (byte_1ECD7E312 != v1)
  {
    byte_1ECD7E312 = *(_BYTE *)(a1 + 32);
    HIDWORD(v6) = v1;
    LODWORD(v6) = 1104;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v2 = off_1ECD7E468;
    v10 = off_1ECD7E468;
    if (!off_1ECD7E468)
    {
      v3 = AudioToolboxLibrary_1();
      v2 = dlsym(v3, "AudioServicesSetProperty");
      v8[3] = (uint64_t)v2;
      off_1ECD7E468 = v2;
    }
    _Block_object_dispose(&v7, 8);
    if (v2)
    {
      ((void (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))v2)(1633907745, 4, &v6, 4, (char *)&v6 + 4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OSStatus __AudioServicesSetProperty(AudioServicesPropertyID, UInt32, const void *, UInt32, const void *)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UIDevice.m"), 92, CFSTR("%s"), dlerror(), v6, v7);

      __break(1u);
    }
  }
}

void __UpdateSystemSoundActiveStatus_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.UIKit.systemSoundActivation", 0);
  v1 = (void *)qword_1ECD7E458;
  qword_1ECD7E458 = (uint64_t)v0;

}

@end
