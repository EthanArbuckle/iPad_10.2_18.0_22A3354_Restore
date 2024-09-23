@implementation MOTrendBundler

- (MOTrendBundler)init
{
  MOTrendBundler *v2;
  NSDictionary *v3;
  NSDictionary *configuration;
  MOTrendBundlerPredicate *predicate;
  MOTrendBundlerAnnotator *annotator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOTrendBundler;
  v2 = -[MOTrendBundler init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSDictionary);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    predicate = v2->_predicate;
    v2->_predicate = 0;

    annotator = v2->_annotator;
    v2->_annotator = 0;

  }
  return v2;
}

- (MOTrendBundler)initWithPredicate:(id)a3 andAnnotator:(id)a4
{
  id v6;
  id v7;
  MOTrendBundler *v8;
  NSDictionary *v9;
  NSDictionary *configuration;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOTrendBundler;
  v8 = -[MOTrendBundler init](&v12, "init");
  if (v8)
  {
    v9 = objc_opt_new(NSDictionary);
    configuration = v8->_configuration;
    v8->_configuration = v9;

    -[MOTrendBundler setPredicate:](v8, "setPredicate:", v6);
    -[MOTrendBundler setAnnotator:](v8, "setAnnotator:", v7);
  }

  return v8;
}

- (void)setPredicate:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_predicate, a3);
  v5 = a3;
  -[MOTrendBundlerPredicate configure:](self->_predicate, "configure:", self->_configuration);

}

- (void)setAnnotator:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_annotator, a3);
  v5 = a3;
  -[MOTrendBundlerAnnotator configure:](self->_annotator, "configure:", self->_configuration);

}

- (BOOL)configure:(id)a3
{
  NSDictionary *v4;
  NSDictionary *configuration;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  configuration = self->_configuration;
  self->_configuration = v4;

  v7 = objc_opt_class(self->_predicate, v6);
  if ((objc_opt_respondsToSelector(v7, "configure:") & 1) != 0)
    v9 = -[MOTrendBundlerPredicate configure:](self->_predicate, "configure:", self->_configuration);
  else
    v9 = 1;
  v10 = objc_opt_class(self->_annotator, v8);
  if ((objc_opt_respondsToSelector(v10, "configure:") & 1) != 0)
    v9 &= -[MOTrendBundlerAnnotator configure:](self->_annotator, "configure:", self->_configuration);
  return v9;
}

- (id)processPatternEvents:(id)a3 withEvents:(id)a4
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  NSString *trendDetectorName;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSString *v26;
  NSString *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  id v31;
  NSString *v32;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  NSString *v37;

  v7 = a3;
  v8 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    trendDetectorName = self->_trendDetectorName;
    *(_DWORD *)buf = 138412290;
    v35 = trendDetectorName;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Creating trend bundles from events for %@...", buf, 0xCu);
  }

  if (!self->_predicate)
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MOTrendBundler processPatternEvents:withEvents:].cold.2();

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTrendBundler.m"), 77, CFSTR("No trend bundle predicate strategy was defined for %@ (in %s:%d)"), self->_trendDetectorName, "-[MOTrendBundler processPatternEvents:withEvents:]", 77);

  }
  if (!self->_annotator)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOTrendBundler processPatternEvents:withEvents:].cold.1();

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTrendBundler.m"), 78, CFSTR("No trend bundle annotator strategy was defined for %@ (in %s:%d)"), self->_trendDetectorName, "-[MOTrendBundler processPatternEvents:withEvents:]", 78);

  }
  v19 = objc_opt_class(self->_predicate, v12);
  if ((objc_opt_respondsToSelector(v19, "reset") & 1) != 0)
    -[MOTrendBundlerPredicate reset](self->_predicate, "reset");
  v21 = objc_opt_class(self->_annotator, v20);
  if ((objc_opt_respondsToSelector(v21, "reset") & 1) != 0)
    -[MOTrendBundlerAnnotator reset](self->_annotator, "reset");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendBundlerPredicate filterEvents:](self->_predicate, "filterEvents:", v7));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOTrendBundlerAnnotator createTrendBundlesFrom:withEvents:](self->_annotator, "createTrendBundlesFrom:withEvents:", v22, v8));

  if (v23 && objc_msgSend(v23, "count"))
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (NSString *)objc_msgSend(v23, "count");
      v27 = self->_trendDetectorName;
      *(_DWORD *)buf = 134218242;
      v35 = v26;
      v36 = 2112;
      v37 = v27;
      v28 = "Detected %lu trend bundles for %@";
      v29 = v25;
      v30 = 22;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    }
  }
  else
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v25 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v32 = self->_trendDetectorName;
      *(_DWORD *)buf = 138412290;
      v35 = v32;
      v28 = "No trend bundles detected for %@";
      v29 = v25;
      v30 = 12;
      goto LABEL_21;
    }
  }

  return v23;
}

- (NSString)trendDetectorName
{
  return self->_trendDetectorName;
}

- (void)setTrendDetectorName:(id)a3
{
  objc_storeStrong((id *)&self->_trendDetectorName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendDetectorName, 0);
  objc_storeStrong((id *)&self->_annotator, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)processPatternEvents:withEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "No trend bundle annotator strategy was defined for %@ (in %s:%d)", v2, v3, v4, v5, 2u);
}

- (void)processPatternEvents:withEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "No trend bundle predicate strategy was defined for %@ (in %s:%d)", v2, v3, v4, v5, 2u);
}

@end
