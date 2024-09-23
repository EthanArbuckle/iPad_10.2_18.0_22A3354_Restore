@implementation PluginDiskImageGraphNode

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PluginDiskImageGraphNode;
  if (objc_msgSendSuper2(&v12, "validateWithDictionary:error:", v6, a4))
  {
    v9 = 0;
    if (objc_msgSend(v6, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("PluginName"), objc_opt_class(NSString, v7), 0, a4))
    {
      v9 = 0;
      if (objc_msgSend(v6, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("PluginParams"), objc_opt_class(NSDictionary, v8), 0, a4))
      {
        if (objc_msgSend(v6, "count"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Validation failed, input contains unexpected data.")));
          v9 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v10, a4);

        }
        else
        {
          v9 = 1;
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9
{
  id v16;
  id v17;
  PluginDiskImageGraphNode *v18;
  PluginDiskImageGraphNode *v19;
  NSDictionary *v20;
  NSDictionary *pluginParams;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PluginDiskImageGraphNode;
  v18 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:](&v23, "initWithTag:UUID:parentNode:metadata:isCache:", a5, a6, a7, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pluginName, a3);
    v20 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v17, 1);
    pluginParams = v19->_pluginParams;
    v19->_pluginParams = v20;

  }
  return v19;
}

- (PluginDiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  PluginDiskImageGraphNode *v12;
  uint64_t v13;
  NSString *pluginName;
  uint64_t v15;
  NSDictionary *pluginParams;
  PluginDiskImageGraphNode *v17;
  objc_super v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (+[PluginDiskImageGraphNode validateWithDictionary:error:](PluginDiskImageGraphNode, "validateWithDictionary:error:", v10, a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)PluginDiskImageGraphNode;
    v12 = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:](&v19, "initWithDictionary:updateChangesToDict:workDir:error:", v10, v8, v11, a6);
    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginName")));
      pluginName = v12->_pluginName;
      v12->_pluginName = (NSString *)v13;

      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginParams")));
      pluginParams = v12->_pluginParams;
      v12->_pluginParams = (NSDictionary *)v15;

    }
    self = v12;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)deleteImage
{
  return 1;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PluginDiskImageGraphNode;
  v3 = -[DiskImageGraphNode toDictionary](&v9, "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginName](self, "pluginName"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("PluginName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginParams](self, "pluginParams"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PluginParams"));

  return v5;
}

- (id)URL
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginName](self, "pluginName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginParams](self, "pluginParams"));
  v5 = +[DIURL newDIURLWithPluginName:params:](DIURL, "newDIURLWithPluginName:params:", v3, v4);

  return v5;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
  objc_storeStrong((id *)&self->_pluginName, a3);
}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void)setPluginParams:(id)a3
{
  objc_storeStrong((id *)&self->_pluginParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginParams, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
}

@end
