@implementation UISDisplayContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionArea, 0);
  objc_storeStrong((id *)&self->_displayEdgeInfo, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (UISDisplayContext)initWithXPCDictionary:(id)a3
{
  id v4;
  UISDisplayContext *v5;
  uint64_t v6;
  FBSDisplayConfiguration *displayConfiguration;
  uint64_t v8;
  UISApplicationSupportDisplayEdgeInfo *displayEdgeInfo;
  uint64_t v10;
  UISDisplayShape *exclusionArea;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISDisplayContext;
  v5 = -[UISDisplayContext init](&v13, sel_init);
  if (v5)
  {
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v6 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v5->_displayConfiguration;
    v5->_displayConfiguration = (FBSDisplayConfiguration *)v6;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v8 = objc_claimAutoreleasedReturnValue();
    displayEdgeInfo = v5->_displayEdgeInfo;
    v5->_displayEdgeInfo = (UISApplicationSupportDisplayEdgeInfo *)v8;

    v5->_artworkSubtype = xpc_dictionary_get_uint64(v4, "ArtworkSubtype");
    v5->_userInterfaceStyle = xpc_dictionary_get_uint64(v4, "UserInterfaceStyle");
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v10 = objc_claimAutoreleasedReturnValue();
    exclusionArea = v5->_exclusionArea;
    v5->_exclusionArea = (UISDisplayShape *)v10;

  }
  return v5;
}

- (UISDisplayContext)initWithDisplayConfiguration:(id)a3 displayEdgeInfo:(id)a4 exclusionArea:(id)a5
{
  id v8;
  id v9;
  id v10;
  UISDisplayContext *v11;
  uint64_t v12;
  FBSDisplayConfiguration *displayConfiguration;
  uint64_t v14;
  UISApplicationSupportDisplayEdgeInfo *displayEdgeInfo;
  uint64_t v16;
  UISDisplayShape *exclusionArea;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UISDisplayContext;
  v11 = -[UISDisplayContext init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    displayConfiguration = v11->_displayConfiguration;
    v11->_displayConfiguration = (FBSDisplayConfiguration *)v12;

    v14 = objc_msgSend(v9, "copy");
    displayEdgeInfo = v11->_displayEdgeInfo;
    v11->_displayEdgeInfo = (UISApplicationSupportDisplayEdgeInfo *)v14;

    v11->_artworkSubtype = 0;
    v11->_userInterfaceStyle = 0;
    v16 = objc_msgSend(v10, "copy");
    exclusionArea = v11->_exclusionArea;
    v11->_exclusionArea = (UISDisplayShape *)v16;

  }
  return v11;
}

- (id)_initWithDisplayContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UISDisplayContext *v8;

  v4 = a3;
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayEdgeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exclusionArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UISDisplayContext initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:](self, "initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:", v5, v6, v7);

  if (v8)
  {
    v8->_artworkSubtype = objc_msgSend(v4, "artworkSubtype");
    v8->_userInterfaceStyle = objc_msgSend(v4, "userInterfaceStyle");
  }

  return v8;
}

- (UISApplicationSupportDisplayEdgeInfo)displayEdgeInfo
{
  return self->_displayEdgeInfo;
}

- (UISDisplayShape)exclusionArea
{
  return self->_exclusionArea;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

+ (id)defaultContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)_MergedGlobals_16;
  v13 = _MergedGlobals_16;
  if (!_MergedGlobals_16)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getCADisplayClass_block_invoke;
    v9[3] = &unk_1E2CAF658;
    v9[4] = &v10;
    __getCADisplayClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v4, "mainDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D230A8]), "initWithCADisplay:", v5);
  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisplayConfiguration:", v6);
LABEL_8:

  return v7;
}

- (UISDisplayContext)initWithDisplayConfiguration:(id)a3
{
  return -[UISDisplayContext initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:](self, "initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:", a3, 0, 0);
}

- (unint64_t)artworkSubtype
{
  return self->_artworkSubtype;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_uint64(xdict, "ArtworkSubtype", self->_artworkSubtype);
  xpc_dictionary_set_uint64(xdict, "UserInterfaceStyle", self->_userInterfaceStyle);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (UISDisplayContext)initWithDisplayConfiguration:(id)a3 displayEdgeInfo:(id)a4
{
  return -[UISDisplayContext initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:](self, "initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:", a3, a4, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UISDisplayContext _initWithDisplayContext:]([UISMutableDisplayContext alloc], "_initWithDisplayContext:", self);
}

- (BOOL)isEqual:(id)a3
{
  UISDisplayContext *v4;
  UISDisplayContext *v5;
  UISDisplayContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;

  v4 = (UISDisplayContext *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if (v4 == self)
  {
    v17 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[UISDisplayContext displayConfiguration](self, "displayConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISDisplayContext displayConfiguration](v6, "displayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[UISDisplayContext displayEdgeInfo](self, "displayEdgeInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISDisplayContext displayEdgeInfo](v6, "displayEdgeInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10)
        && (v11 = -[UISDisplayContext artworkSubtype](self, "artworkSubtype"),
            v11 == -[UISDisplayContext artworkSubtype](v6, "artworkSubtype"))
        && (v12 = -[UISDisplayContext userInterfaceStyle](self, "userInterfaceStyle"),
            v12 == -[UISDisplayContext userInterfaceStyle](v6, "userInterfaceStyle")))
      {
        -[UISDisplayContext exclusionArea](self, "exclusionArea");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISDisplayContext exclusionArea](v6, "exclusionArea");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
        {
          v17 = 1;
        }
        else
        {
          -[UISDisplayContext exclusionArea](self, "exclusionArea");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UISDisplayContext exclusionArea](v6, "exclusionArea");
          v19 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          v13 = v19;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
LABEL_10:
    v17 = 0;
  }
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[UISDisplayContext displayConfiguration](self, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UISDisplayContext displayEdgeInfo](self, "displayEdgeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[UISDisplayContext artworkSubtype](self, "artworkSubtype");
  v8 = v7 ^ -[UISDisplayContext userInterfaceStyle](self, "userInterfaceStyle");
  -[UISDisplayContext exclusionArea](self, "exclusionArea");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayConfiguration, CFSTR("DisplayConfiguration"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayEdgeInfo, CFSTR("DisplayEdgeInfo"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_artworkSubtype, CFSTR("ArtworkSubtype"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_userInterfaceStyle, CFSTR("UserInterfaceStyle"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_exclusionArea, CFSTR("ExclusionArea"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

@end
