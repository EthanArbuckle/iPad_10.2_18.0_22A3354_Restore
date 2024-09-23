@implementation _TUIElementConfigurationBuilder

- (void)addConfigurationData:(id)a3 withKey:(id)a4
{
  id v6;
  NSMutableDictionary *data;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  data = self->_data;
  if (!data)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_data;
    self->_data = v8;

    data = self->_data;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](data, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)finalizeConfiguration
{
  return -[NSMutableDictionary copy](self->_data, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
