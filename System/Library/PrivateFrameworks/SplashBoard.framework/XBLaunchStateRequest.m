@implementation XBLaunchStateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_urlSchemeName, 0);
  objc_storeStrong((id *)&self->_customSafeAreaInsets, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  xpc_object_t v5;
  void *v6;

  v5 = xpc_dictionary_create(0, 0, 0);
  -[XBLaunchStateRequest encodeWithXPCDictionary:](self, "encodeWithXPCDictionary:", v5);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithXPCDictionary:", v5);

  return v6;
}

- (XBLaunchStateRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  XBLaunchStateRequest *v5;
  uint64_t v6;
  FBSDisplayConfiguration *displayConfiguration;
  uint64_t v8;
  NSString *groupID;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  XBDisplayEdgeInsetsWrapper *customSafeAreaInsets;
  uint64_t v16;
  NSString *urlSchemeName;
  uint64_t v18;
  NSString *launchInterfaceIdentifier;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)XBLaunchStateRequest;
  v5 = -[XBLaunchStateRequest init](&v21, sel_init);
  if (v5)
  {
    v6 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    displayConfiguration = v5->_displayConfiguration;
    v5->_displayConfiguration = (FBSDisplayConfiguration *)v6;

    v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    v5->_statusBarState = xpc_dictionary_get_int64(v4, "statusBarState");
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
    v5->_referenceSize.width = v10;
    v5->_referenceSize.height = v11;
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
    v5->_naturalSize.width = v12;
    v5->_naturalSize.height = v13;
    v5->_interfaceOrientation = xpc_dictionary_get_int64(v4, "interfaceOrientation");
    v5->_userInterfaceStyle = xpc_dictionary_get_int64(v4, "userInterfaceStyle");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v14 = objc_claimAutoreleasedReturnValue();
    customSafeAreaInsets = v5->_customSafeAreaInsets;
    v5->_customSafeAreaInsets = (XBDisplayEdgeInsetsWrapper *)v14;

    v16 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    urlSchemeName = v5->_urlSchemeName;
    v5->_urlSchemeName = (NSString *)v16;

    v18 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    launchInterfaceIdentifier = v5->_launchInterfaceIdentifier;
    v5->_launchInterfaceIdentifier = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "statusBarState", self->_statusBarState);
  BSSerializeCGSizeToXPCDictionaryWithKey();
  BSSerializeCGSizeToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "interfaceOrientation", self->_interfaceOrientation);
  xpc_dictionary_set_int64(xdict, "userInterfaceStyle", self->_userInterfaceStyle);
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)launchInterfaceIdentifier
{
  return self->_launchInterfaceIdentifier;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (unint64_t)statusBarState
{
  return self->_statusBarState;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (NSString)urlSchemeName
{
  return self->_urlSchemeName;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setReferenceSize:(CGSize)a3
{
  int64_t interfaceOrientation;

  self->_referenceSize = a3;
  interfaceOrientation = self->_interfaceOrientation;
  if ((unint64_t)(interfaceOrientation - 3) > 1)
  {
    if (interfaceOrientation)
      self->_naturalSize = self->_referenceSize;
  }
  else
  {
    self->_naturalSize.width = a3.height;
    self->_naturalSize.height = a3.width;
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setUrlSchemeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setStatusBarState:(unint64_t)a3
{
  self->_statusBarState = a3;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDisplayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayConfiguration, a3);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
  if (self->_referenceSize.width == *MEMORY[0x24BDBF148]
    && self->_referenceSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[XBLaunchStateRequest setNaturalSize:](self, "setNaturalSize:", self->_naturalSize.width, self->_naturalSize.height);
  }
  else
  {
    -[XBLaunchStateRequest setReferenceSize:](self, "setReferenceSize:");
  }
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setLaunchInterfaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setCustomSafeAreaInsets:(id)a3
{
  objc_storeStrong((id *)&self->_customSafeAreaInsets, a3);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_groupID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  unint64_t statusBarState;
  int64_t interfaceOrientation;
  int64_t userInterfaceStyle;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualStrings()
      && ((objc_msgSend(v5, "referenceSize"), self->_referenceSize.width == v8)
        ? (v9 = self->_referenceSize.height == v7)
        : (v9 = 0),
          v9
       && (statusBarState = self->_statusBarState, statusBarState == objc_msgSend(v5, "statusBarState"))
       && (interfaceOrientation = self->_interfaceOrientation,
           interfaceOrientation == objc_msgSend(v5, "interfaceOrientation"))
       && (userInterfaceStyle = self->_userInterfaceStyle, userInterfaceStyle == objc_msgSend(v5, "userInterfaceStyle"))))
    {
      objc_msgSend(v5, "urlSchemeName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings())
      {
        objc_msgSend(v5, "launchInterfaceIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = BSEqualStrings();

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)-[XBLaunchStateRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBLaunchStateRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBLaunchStateRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  unint64_t statusBarState;
  const __CFString *v6;
  id v7;
  id v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_groupID, CFSTR("groupID"));
  statusBarState = self->_statusBarState;
  if (statusBarState > 2)
    v6 = CFSTR("invalid");
  else
    v6 = off_24D7F42C0[statusBarState];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("statusBar"));
  v8 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("refSize"), self->_referenceSize.width, self->_referenceSize.height);
  if (self->_referenceSize.width != self->_naturalSize.width
    || self->_referenceSize.height != self->_naturalSize.height)
  {
    v10 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("naturalSize"));
  }
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_customSafeAreaInsets, CFSTR("customSafeAreaInsets"), 1);
  XBStringForInterfaceOrientation(self->_interfaceOrientation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("orientation"));

  XBStringForUserInterfaceStyle(self->_userInterfaceStyle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("userInterfaceStyle"));

  v16 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_urlSchemeName, CFSTR("scheme"), 1);
  return v3;
}

- (void)setNaturalSize:(CGSize)a3
{
  int64_t interfaceOrientation;

  self->_naturalSize = a3;
  interfaceOrientation = self->_interfaceOrientation;
  if ((unint64_t)(interfaceOrientation - 3) > 1)
  {
    if (interfaceOrientation)
      self->_referenceSize = self->_naturalSize;
  }
  else
  {
    self->_referenceSize.width = a3.height;
    self->_referenceSize.height = a3.width;
  }
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalSize.width;
  height = self->_naturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
