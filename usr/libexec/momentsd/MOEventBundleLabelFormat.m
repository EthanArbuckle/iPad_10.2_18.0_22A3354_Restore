@implementation MOEventBundleLabelFormat

- (MOEventBundleLabelFormat)initWithFormat:(id)a3 capitalizationType:(unint64_t)a4
{
  id v8;
  MOEventBundleLabelFormat *v9;
  MOEventBundleLabelFormat *v10;
  MOEventBundleLabelFormat *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)MOEventBundleLabelFormat;
    v9 = -[MOEventBundleLabelFormat init](&v16, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_format, a3);
      v10->_capitalizationType = a4;
    }
    self = v10;
    v11 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormat initWithFormat:capitalizationType:].cold.1(v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelFormat.m"), 16, CFSTR("Invalid parameter not satisfying: format"));

    v11 = 0;
  }

  return v11;
}

- (MOEventBundleLabelFormat)initWithFormat:(id)a3
{
  return -[MOEventBundleLabelFormat initWithFormat:capitalizationType:](self, "initWithFormat:capitalizationType:", a3, 1);
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormat format](self, "format"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("labels, %@, capitalization type, %lu"), v3, -[MOEventBundleLabelFormat capitalizationType](self, "capitalizationType")));

  return v4;
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)capitalizationType
{
  return self->_capitalizationType;
}

- (void)setCapitalizationType:(unint64_t)a3
{
  self->_capitalizationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
}

- (void)initWithFormat:(os_log_t)log capitalizationType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: format", v1, 2u);
}

@end
