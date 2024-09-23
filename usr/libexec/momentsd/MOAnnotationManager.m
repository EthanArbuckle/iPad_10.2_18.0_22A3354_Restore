@implementation MOAnnotationManager

- (MOAnnotationManager)initWithUniverse:(id)a3
{
  id v5;
  MOAnnotationManager *v6;
  MOAnnotationManager *v7;
  MODaemonUniverse *fUniverse;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  MOTimeZoneManager *timeZoneManager;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MOAnnotationManager;
  v6 = -[MOAnnotationManager init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    fUniverse = v7->_fUniverse;
    v10 = (objc_class *)objc_opt_class(MOTimeZoneManager, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v12));
    timeZoneManager = v7->_timeZoneManager;
    v7->_timeZoneManager = (MOTimeZoneManager *)v13;

  }
  return v7;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id os_log;
  NSObject *v8;
  void *v9;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MOAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:].cold.1(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAnnotationManager.m"), 36, CFSTR("Use the derived class (in %s:%d)"), "-[MOAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:]", 36);

}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (MOTimeZoneManager)timeZoneManager
{
  return self->_timeZoneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneManager, 0);
  objc_storeStrong((id *)&self->_fUniverse, 0);
}

- (void)performAnnotationWithEvents:(os_log_t)log withPatternEvents:handler:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:]";
  v3 = 1024;
  v4 = 36;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Use the derived class (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
