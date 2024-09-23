@implementation CSMapDataQuality

+ (id)sharedInstance
{
  if (qword_100389370 != -1)
    dispatch_once(&qword_100389370, &stru_10035BB50);
  return (id)qword_100389368;
}

- (CSMapDataQuality)initWithGEOCountryConfiguration:(id)a3
{
  id v5;
  CSMapDataQuality *v6;
  CSMapDataQuality *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSMapDataQuality;
  v6 = -[CSMapDataQuality init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_config, a3);

  return v7;
}

- (BOOL)turnByTurnDirectionsEnabled
{
  GEOCountryConfiguration *config;
  NSObject *v4;
  void *v5;
  void *v6;
  GEOCountryConfiguration *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  int v13;
  void *v14;

  config = self->_config;
  if (!config)
  {
    if (qword_100387470 != -1)
      dispatch_once(&qword_100387470, &stru_10035BB70);
    v4 = qword_100387478;
    if (os_log_type_enabled((os_log_t)qword_100387478, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error reading country configuration", (uint8_t *)&v13, 2u);
    }
    config = self->_config;
    if (!config)
      goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCountryConfiguration countryCode](config, "countryCode"));

  if (v5)
  {
    if (qword_100387470 != -1)
      dispatch_once(&qword_100387470, &stru_10035BB70);
    v6 = (void *)qword_100387478;
    if (os_log_type_enabled((os_log_t)qword_100387478, OS_LOG_TYPE_DEBUG))
    {
      v7 = self->_config;
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCountryConfiguration countryCode](v7, "countryCode"));
      v13 = 138477827;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Country code %{private}@", (uint8_t *)&v13, 0xCu);

    }
    v10 = -[GEOCountryConfiguration currentCountrySupportsDirections](self->_config, "currentCountrySupportsDirections");
  }
  else
  {
LABEL_13:
    v10 = 0;
  }
  if (qword_100387470 != -1)
    dispatch_once(&qword_100387470, &stru_10035BB70);
  v11 = qword_100387478;
  if (os_log_type_enabled((os_log_t)qword_100387478, OS_LOG_TYPE_INFO))
  {
    v13 = 67240192;
    LODWORD(v14) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Turn by turn directions: %{public}d", (uint8_t *)&v13, 8u);
  }
  return v10;
}

- (GEOCountryConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
