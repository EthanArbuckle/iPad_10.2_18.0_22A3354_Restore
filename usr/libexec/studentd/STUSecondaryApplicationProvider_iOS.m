@implementation STUSecondaryApplicationProvider_iOS

- (void)updateWithBundleIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  if (v8 | v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
    v6 = objc_msgSend(v5, "isEqual:", v8);

    if ((v6 & 1) == 0)
    {
      v7 = objc_msgSend((id)v8, "copy");
      -[STUDevicePropertyProvider setValue:](self, "setValue:", v7);

    }
  }

}

- (id)key
{
  return CRKDeviceSecondaryOpenApplicationKey;
}

@end
