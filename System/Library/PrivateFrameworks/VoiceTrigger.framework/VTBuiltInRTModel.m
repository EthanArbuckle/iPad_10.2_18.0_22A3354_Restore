@implementation VTBuiltInRTModel

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating VTBuiltInRTModel", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VTBuiltInRTModel;
  -[VTBuiltInRTModel dealloc](&v4, sel_dealloc);
}

- (NSDictionary)builtInRTModelDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBuiltInRTModelDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtInRTModelDictionary, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_69);
  return (id)sharedInstance_sharedRTModel;
}

void __34__VTBuiltInRTModel_sharedInstance__block_invoke()
{
  VTBuiltInRTModel *v0;
  void *v1;

  v0 = objc_alloc_init(VTBuiltInRTModel);
  v1 = (void *)sharedInstance_sharedRTModel;
  sharedInstance_sharedRTModel = (uint64_t)v0;

}

@end
