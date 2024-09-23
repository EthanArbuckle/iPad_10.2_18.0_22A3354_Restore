@implementation _UIOServerActionOriginContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginContext
{
  _UIOServerActionOriginContext *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(_UIOServerActionOriginContext);
  +[UIWindowScene _keyWindowScene]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOServerActionOriginContext _configureWithWindow:](v2, "_configureWithWindow:", v4);

  return v2;
}

+ (id)originContextForView:(id)a3 referencePoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  _UIOServerActionOriginContext *v7;
  void *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  v7 = objc_alloc_init(_UIOServerActionOriginContext);
  objc_msgSend(v6, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOServerActionOriginContext _configureWithWindow:](v7, "_configureWithWindow:", v8);

  objc_msgSend(v6, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v7->_layerId = CALayerGetRenderId();
  v7->_layerReferencePoint.x = x;
  v7->_layerReferencePoint.y = y;
  return v7;
}

- (void)_configureWithWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSString *v9;
  NSString *sceneIdentity;
  void *v11;
  NSString *v12;
  NSString *spaceIdentifier;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSString *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "_contextId");

    self->_contextId = v7;
    objc_msgSend(v6, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringRepresentation");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    sceneIdentity = self->_sceneIdentity;
    self->_sceneIdentity = v9;

    objc_msgSend(v5, "systemShellHostingEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemShellHostingSpaceIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    spaceIdentifier = self->_spaceIdentifier;
    self->_spaceIdentifier = v12;

    if (!self->_spaceIdentifier)
    {
      UIOLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v16;
        v20 = 2050;
        v21 = v5;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Could not find a systemShellHostingSpaceIdentifier for scene: <%{public}@: %{public}p>", (uint8_t *)&v18, 0x16u);

      }
      v17 = self->_spaceIdentifier;
      self->_spaceIdentifier = (NSString *)CFSTR("Unspecified");

    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *sceneIdentity;
  NSString *spaceIdentifier;
  id v7;

  v4 = a3;
  sceneIdentity = self->_sceneIdentity;
  v7 = v4;
  if (sceneIdentity)
  {
    objc_msgSend(v4, "encodeObject:forKey:", sceneIdentity, CFSTR("scene"));
    v4 = v7;
  }
  spaceIdentifier = self->_spaceIdentifier;
  if (spaceIdentifier)
  {
    objc_msgSend(v7, "encodeObject:forKey:", spaceIdentifier, CFSTR("space"));
    v4 = v7;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_layerId, CFSTR("layer"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_contextId, CFSTR("context"));
  objc_msgSend(v7, "encodeCGPoint:forKey:", CFSTR("layerPoint"), self->_layerReferencePoint.x, self->_layerReferencePoint.y);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIOServerActionOriginContext *v4;

  if (-[_UIOServerActionOriginContext isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v4 = objc_alloc_init(_UIOServerActionOriginContext);
  objc_storeStrong((id *)&v4->_sceneIdentity, self->_sceneIdentity);
  objc_storeStrong((id *)&v4->_spaceIdentifier, self->_spaceIdentifier);
  v4->_layerReferencePoint = self->_layerReferencePoint;
  v4->_layerId = self->_layerId;
  v4->_contextId = self->_contextId;
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _UIOMutableActionOriginContext *v4;

  v4 = objc_alloc_init(_UIOMutableActionOriginContext);
  -[_UIOMutableActionOriginContext setSceneIdentity:](v4, "setSceneIdentity:", self->_sceneIdentity);
  -[_UIOMutableActionOriginContext setSpaceIdentifier:](v4, "setSpaceIdentifier:", self->_spaceIdentifier);
  -[_UIOMutableActionOriginContext setLayerReferencePoint:](v4, "setLayerReferencePoint:", self->_layerReferencePoint.x, self->_layerReferencePoint.y);
  -[_UIOMutableActionOriginContext setLayerId:](v4, "setLayerId:", self->_layerId);
  -[_UIOMutableActionOriginContext setContextId:](v4, "setContextId:", self->_contextId);
  return v4;
}

- (_UIOServerActionOriginContext)initWithCoder:(id)a3
{
  id v4;
  _UIOServerActionOriginContext *v5;
  uint64_t v6;
  NSString *sceneIdentity;
  uint64_t v8;
  NSString *spaceIdentifier;
  CGFloat v10;
  CGFloat v11;

  v4 = a3;
  v5 = -[_UIOServerActionOriginContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scene"));
    v6 = objc_claimAutoreleasedReturnValue();
    sceneIdentity = v5->_sceneIdentity;
    v5->_sceneIdentity = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("space"));
    v8 = objc_claimAutoreleasedReturnValue();
    spaceIdentifier = v5->_spaceIdentifier;
    v5->_spaceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("layerPoint"));
    v5->_layerReferencePoint.x = v10;
    v5->_layerReferencePoint.y = v11;
    v5->_layerId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("layer"));
    v5->_contextId = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("context"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_sceneIdentity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  NSStringFromSelector(sel_spaceIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  NSStringFromSelector(sel_layerReferencePoint);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  NSStringFromSelector(sel_layerId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  NSStringFromSelector(sel_contextId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGPoint)translatedReferencePointForDestinationView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  double v12;
  CATransform3D v13;
  CATransform3D v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CATransform3D v23;
  CGPoint result;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_contextId");

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CALayerGetRenderId();
  memset(&v23, 0, sizeof(v23));
  BKSHIDServicesGetCALayerTransform();
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v20 = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v22 = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v15 = *MEMORY[0x1E0CD2610];
  v16 = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v18 = v10;
  if (self->_contextId)
    BKSHIDServicesGetCALayerTransform();
  CA_CGPointApplyTransform();
  v14 = v23;
  CATransform3DInvert(&v13, &v14);
  CA_CGPointApplyTransform();
  result.y = v12;
  result.x = v11;
  return result;
}

- (NSString)sceneIdentity
{
  return self->_sceneIdentity;
}

- (NSString)spaceIdentifier
{
  return self->_spaceIdentifier;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (unint64_t)layerId
{
  return self->_layerId;
}

- (CGPoint)layerReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_layerReferencePoint.x;
  y = self->_layerReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaceIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
}

@end
