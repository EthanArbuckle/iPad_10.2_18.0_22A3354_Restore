@implementation MusicAnalyticsGreenTeaLogger

- (MusicAnalyticsGreenTeaLogger)init
{
  MusicAnalyticsGreenTeaLogger *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicAnalyticsGreenTeaLogger;
  v2 = -[MusicAnalyticsGreenTeaLogger init](&v4, "init");
  if (v2)
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create("music");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy(self->_logger, a2);
  v3.receiver = self;
  v3.super_class = (Class)MusicAnalyticsGreenTeaLogger;
  -[MusicAnalyticsGreenTeaLogger dealloc](&v3, "dealloc");
}

- (void)logCameraAccess
{
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(-[MusicAnalyticsGreenTeaLogger logger](self, "logger"));
  v3 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Accessing camera", v5, 2u);
  }

}

- (void)logPhotoAccess
{
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(-[MusicAnalyticsGreenTeaLogger logger](self, "logger"));
  v3 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Accessing photos", v5, 2u);
  }

}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

@end
