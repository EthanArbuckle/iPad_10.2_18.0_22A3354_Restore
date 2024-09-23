@implementation MSDSettingsContext

+ (id)defaultContextForIdentifier:(id)a3
{
  id v3;
  MSDSettingsContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(MSDSettingsContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  return v4;
}

- (NSDictionary)dataDict
{
  return self->_dataDict;
}

- (void)setDataDict:(id)a3
{
  objc_storeStrong((id *)&self->_dataDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDict, 0);
}

@end
