@implementation VKKeyboardCameraDefaults

+ (VKKeyboardCameraDefaults)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  return (VKKeyboardCameraDefaults *)(id)sharedInstance_instance;
}

void __42__VKKeyboardCameraDefaults_sharedInstance__block_invoke()
{
  VKKeyboardCameraDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(VKKeyboardCameraDefaults);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (VKKeyboardCameraDefaults)init
{
  VKKeyboardCameraDefaults *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  NSUserDefaults *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VKKeyboardCameraDefaults;
  v2 = -[VKKeyboardCameraDefaults init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.KeyboardCamera"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v5 = v2->_defaults;
    v9[0] = CFSTR("MaskOpacity");
    v9[1] = CFSTR("CutoutExpansionScale");
    v10[0] = &unk_1E9495158;
    v10[1] = &unk_1E9495158;
    v9[2] = CFSTR("CutoutRadiusScale");
    v9[3] = CFSTR("DimmingOpacity");
    v10[2] = &unk_1E9495168;
    v10[3] = &unk_1E9495178;
    v9[4] = CFSTR("DimmingRadius");
    v9[5] = CFSTR("HideTapToRadar");
    v10[4] = &unk_1E9495188;
    v10[5] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults registerDefaults:](v5, "registerDefaults:", v6);

  }
  return v2;
}

- (double)doubleForKey:(id)a3
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", a3);
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
