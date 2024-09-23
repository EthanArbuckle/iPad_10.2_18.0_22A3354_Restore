@implementation VFXMetalWireframeResource

- (void)dealloc
{
  void *programHashCode;
  objc_super v4;
  _QWORD block[5];

  CFRelease(self->material);
  CFRelease(self->program);
  programHashCode = self->programHashCode;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B18F8B84;
  block[3] = &unk_1E63D8F10;
  block[4] = programHashCode;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v4.receiver = self;
  v4.super_class = (Class)VFXMetalWireframeResource;
  -[VFXMetalWireframeResource dealloc](&v4, sel_dealloc);
}

@end
