@implementation SBSSystemNotesTakeScreenshotResult

- (SBSSystemNotesTakeScreenshotResult)initWithDisplay:(id)a3 sendRight:(id)a4 scale:(double)a5
{
  id v9;
  id v10;
  SBSSystemNotesTakeScreenshotResult *v11;
  SBSSystemNotesTakeScreenshotResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSSystemNotesTakeScreenshotResult;
  v11 = -[SBSSystemNotesTakeScreenshotResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_displayIdentity, a3);
    objc_storeStrong((id *)&v12->_machPortSendRight, a4);
    v12->_scale = a5;
  }

  return v12;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();

  }
}

- (SBSSystemNotesTakeScreenshotResult)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  SBSSystemNotesTakeScreenshotResult *v9;

  v4 = a3;
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  v8 = v7;

  v9 = -[SBSSystemNotesTakeScreenshotResult initWithDisplay:sendRight:scale:](self, "initWithDisplay:sendRight:scale:", v5, v6, v8);
  return v9;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (BSMachPortSendRight)machPortSendRight
{
  return self->_machPortSendRight;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machPortSendRight, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end
