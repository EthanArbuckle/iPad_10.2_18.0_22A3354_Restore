@implementation UIDraggingSessionConfiguration

- (CGPoint)initialCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialCentroid.x;
  y = self->_initialCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCentroid:(CGPoint)a3
{
  self->_initialCentroid.x = a3.x;
  self->_initialCentroid.y = a3.y;
  self->_initialCentroid.z = 0.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDraggingSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIDraggingSessionConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UIDraggingSessionConfiguration *v9;
  uint64_t v10;
  NSArray *touchIDs;
  UIDraggingSessionConfiguration *v12;
  double v13;
  double v14;
  UIDraggingSessionConfiguration *v15;
  double v16;
  double v17;
  uint64_t v18;
  UIDraggingSessionConfiguration *v19;
  uint64_t v20;
  _DUITargetLayerDescriptor *coordinateSpaceSourceLayerContext;
  uint64_t v22;
  UIDraggingSessionConfiguration *v23;
  uint64_t v24;
  UIDraggingSystemTouchRoutingPolicy *routingPolicy;
  void *v26;
  UIDraggingSessionConfiguration *v27;
  uint64_t v28;
  PBItemCollection *itemCollection;
  uint64_t v30;
  UIDraggingSessionConfiguration *v31;
  uint64_t v32;
  NSXPCListenerEndpoint *dataProviderEndpoint;
  uint64_t v34;
  UIDraggingSessionConfiguration *v35;
  uint64_t v36;
  NSXPCListenerEndpoint *axEndpoint;
  UIDraggingSessionConfiguration *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  void *v46;
  _BYTE *v47;
  void *v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  _BYTE *v52;
  _BYTE *v53;
  _BYTE *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  _BYTE *v68;
  _BYTE *v69;
  objc_super v71;

  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)UIDraggingSessionConfiguration;
  v5 = -[UIDraggingSessionConfiguration init](&v71, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("touchIDs"));
    v10 = objc_claimAutoreleasedReturnValue();
    touchIDs = v9->_touchIDs;
    v9->_touchIDs = (NSArray *)v10;

    v12 = v9;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("initialCentroid"));
    v9->_initialCentroid.x = v13;
    v12->_initialCentroid.y = v14;
    v12->_initialCentroid.z = 0.0;
    v15 = v12;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("initialCentroidInSourceWindow"));
    v12->_initialCentroidInSourceWindow.x = v16;
    v15->_initialCentroidInSourceWindow.y = v17;
    v15->_initialCentroidInSourceWindow.z = 0.0;
    v18 = objc_opt_class();
    v19 = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("coordinateSpaceSourceLayerContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    coordinateSpaceSourceLayerContext = v19->_coordinateSpaceSourceLayerContext;
    v19->_coordinateSpaceSourceLayerContext = (_DUITargetLayerDescriptor *)v20;

    v22 = objc_opt_class();
    v23 = v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("routingPolicy"));
    v24 = objc_claimAutoreleasedReturnValue();
    routingPolicy = v23->_routingPolicy;
    v23->_routingPolicy = (UIDraggingSystemTouchRoutingPolicy *)v24;

    objc_msgSend(MEMORY[0x1E0D6C0C0], "allowedClassesForSecureCoding");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("itemCollection"));
    v28 = objc_claimAutoreleasedReturnValue();
    itemCollection = v27->_itemCollection;
    v27->_itemCollection = (PBItemCollection *)v28;

    v30 = objc_opt_class();
    v31 = v27;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, CFSTR("dataProviderEndpoint"));
    v32 = objc_claimAutoreleasedReturnValue();
    dataProviderEndpoint = v31->_dataProviderEndpoint;
    v31->_dataProviderEndpoint = (NSXPCListenerEndpoint *)v32;

    v34 = objc_opt_class();
    v35 = v31;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, CFSTR("axEndpoint"));
    v36 = objc_claimAutoreleasedReturnValue();
    axEndpoint = v35->_axEndpoint;
    v35->_axEndpoint = (NSXPCListenerEndpoint *)v36;

    v38 = v35;
    v38[8] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSystemDrag"));
    v39 = objc_opt_class();
    v40 = v38;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, CFSTR("sceneIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v40[9];
    v40[9] = v41;

    v43 = objc_opt_class();
    v44 = v40;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, CFSTR("persistentSceneIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v44[10];
    v44[10] = v45;

    v47 = v44;
    v47[9] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("initiatedWithPointer"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v47;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("preferredPreviewIndexes"));
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v49[11];
    v49[11] = v50;

    v52 = v49;
    v52[10] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("avoidsKeyboardSuppression"));
    v53 = v52;
    v53[11] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rotatable"));
    v54 = v53;
    v54[12] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resizable"));
    v55 = v54;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("minimumResizableSize"));
    *((_QWORD *)v54 + 13) = v56;
    v55[14] = v57;
    v58 = v55;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("maximumResizableSize"));
    v55[15] = v59;
    v58[16] = v60;
    v61 = v58;
    v61[13] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsElasticEffects"));
    v62 = v61;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("originalRotation"));
    v62[12] = v63;
    v64 = v62;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("originalScale"));
    v62[17] = v65;
    v64[18] = v66;
    v67 = v64;
    v67[14] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsPresentationUpdates"));
    v68 = v67;
    v68[15] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sessionIsRestrictedToSourceApplication"));
    v69 = v68;
    v69[16] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sourceExpectsStagedLegacySelectors"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[UIDraggingSessionConfiguration touchIDs](self, "touchIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("touchIDs"));

  objc_msgSend(v15, "encodeCGPoint:forKey:", CFSTR("initialCentroid"), self->_initialCentroid.x, self->_initialCentroid.y);
  objc_msgSend(v15, "encodeCGPoint:forKey:", CFSTR("initialCentroidInSourceWindow"), self->_initialCentroidInSourceWindow.x, self->_initialCentroidInSourceWindow.y);
  -[UIDraggingSessionConfiguration routingPolicy](self, "routingPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("routingPolicy"));

  -[UIDraggingSessionConfiguration itemCollection](self, "itemCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("itemCollection"));

  -[UIDraggingSessionConfiguration dataProviderEndpoint](self, "dataProviderEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("dataProviderEndpoint"));

  -[UIDraggingSessionConfiguration axEndpoint](self, "axEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("axEndpoint"));

  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration supportsSystemDrag](self, "supportsSystemDrag"), CFSTR("supportsSystemDrag"));
  -[UIDraggingSessionConfiguration sceneIdentifier](self, "sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("sceneIdentifier"));

  -[UIDraggingSessionConfiguration persistentSceneIdentifier](self, "persistentSceneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("persistentSceneIdentifier"));

  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration initiatedWithPointer](self, "initiatedWithPointer"), CFSTR("initiatedWithPointer"));
  -[UIDraggingSessionConfiguration coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIDraggingSessionConfiguration coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("coordinateSpaceSourceLayerContext"));

  }
  -[UIDraggingSessionConfiguration preferredPreviewIndexes](self, "preferredPreviewIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIDraggingSessionConfiguration preferredPreviewIndexes](self, "preferredPreviewIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("preferredPreviewIndexes"));

  }
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration avoidsKeyboardSuppression](self, "avoidsKeyboardSuppression"), CFSTR("avoidsKeyboardSuppression"));
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration rotatable](self, "rotatable"), CFSTR("rotatable"));
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration resizable](self, "resizable"), CFSTR("resizable"));
  -[UIDraggingSessionConfiguration minimumResizableSize](self, "minimumResizableSize");
  objc_msgSend(v15, "encodeCGSize:forKey:", CFSTR("minimumResizableSize"));
  -[UIDraggingSessionConfiguration maximumResizableSize](self, "maximumResizableSize");
  objc_msgSend(v15, "encodeCGSize:forKey:", CFSTR("maximumResizableSize"));
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration wantsElasticEffects](self, "wantsElasticEffects"), CFSTR("wantsElasticEffects"));
  -[UIDraggingSessionConfiguration originalRotation](self, "originalRotation");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("originalRotation"));
  -[UIDraggingSessionConfiguration originalScale](self, "originalScale");
  objc_msgSend(v15, "encodeCGSize:forKey:", CFSTR("originalScale"));
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration wantsPresentationUpdates](self, "wantsPresentationUpdates"), CFSTR("wantsPresentationUpdates"));
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration sessionIsRestrictedToSourceApplication](self, "sessionIsRestrictedToSourceApplication"), CFSTR("sessionIsRestrictedToSourceApplication"));
  objc_msgSend(v15, "encodeBool:forKey:", -[UIDraggingSessionConfiguration sourceExpectsStagedLegacySelectors](self, "sourceExpectsStagedLegacySelectors"), CFSTR("sourceExpectsStagedLegacySelectors"));

}

- (CAPoint3D)_initialCentroid
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_initialCentroid.x;
  y = self->_initialCentroid.y;
  z = self->_initialCentroid.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_initialCentroid:(CAPoint3D)a3
{
  self->_initialCentroid = a3;
}

- (NSArray)touchIDs
{
  return self->_touchIDs;
}

- (void)setTouchIDs:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDs, a3);
}

- (_DUITargetLayerDescriptor)coordinateSpaceSourceLayerContext
{
  return self->_coordinateSpaceSourceLayerContext;
}

- (void)setCoordinateSpaceSourceLayerContext:(id)a3
{
  objc_storeStrong((id *)&self->_coordinateSpaceSourceLayerContext, a3);
}

- (UIDraggingSystemTouchRoutingPolicy)routingPolicy
{
  return self->_routingPolicy;
}

- (void)setRoutingPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_routingPolicy, a3);
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_itemCollection, a3);
}

- (NSXPCListenerEndpoint)dataProviderEndpoint
{
  return self->_dataProviderEndpoint;
}

- (void)setDataProviderEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_dataProviderEndpoint, a3);
}

- (NSXPCListenerEndpoint)axEndpoint
{
  return self->_axEndpoint;
}

- (void)setAxEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_axEndpoint, a3);
}

- (BOOL)supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (void)setSupportsSystemDrag:(BOOL)a3
{
  self->_supportsSystemDrag = a3;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
}

- (NSString)persistentSceneIdentifier
{
  return self->_persistentSceneIdentifier;
}

- (void)setPersistentSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_persistentSceneIdentifier, a3);
}

- (BOOL)initiatedWithPointer
{
  return self->_initiatedWithPointer;
}

- (void)setInitiatedWithPointer:(BOOL)a3
{
  self->_initiatedWithPointer = a3;
}

- (NSIndexSet)preferredPreviewIndexes
{
  return self->_preferredPreviewIndexes;
}

- (void)setPreferredPreviewIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPreviewIndexes, a3);
}

- (BOOL)avoidsKeyboardSuppression
{
  return self->_avoidsKeyboardSuppression;
}

- (void)setAvoidsKeyboardSuppression:(BOOL)a3
{
  self->_avoidsKeyboardSuppression = a3;
}

- (BOOL)rotatable
{
  return self->_rotatable;
}

- (void)setRotatable:(BOOL)a3
{
  self->_rotatable = a3;
}

- (BOOL)resizable
{
  return self->_resizable;
}

- (void)setResizable:(BOOL)a3
{
  self->_resizable = a3;
}

- (CGSize)minimumResizableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumResizableSize.width;
  height = self->_minimumResizableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumResizableSize:(CGSize)a3
{
  self->_minimumResizableSize = a3;
}

- (CGSize)maximumResizableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumResizableSize.width;
  height = self->_maximumResizableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumResizableSize:(CGSize)a3
{
  self->_maximumResizableSize = a3;
}

- (BOOL)wantsElasticEffects
{
  return self->_wantsElasticEffects;
}

- (void)setWantsElasticEffects:(BOOL)a3
{
  self->_wantsElasticEffects = a3;
}

- (double)originalRotation
{
  return self->_originalRotation;
}

- (void)setOriginalRotation:(double)a3
{
  self->_originalRotation = a3;
}

- (CGSize)originalScale
{
  double width;
  double height;
  CGSize result;

  width = self->_originalScale.width;
  height = self->_originalScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalScale:(CGSize)a3
{
  self->_originalScale = a3;
}

- (CAPoint3D)initialCentroid3D
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_initialCentroid3D.x;
  y = self->_initialCentroid3D.y;
  z = self->_initialCentroid3D.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (CAPoint3D)initialCentroidInSourceWindow
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_initialCentroidInSourceWindow.x;
  y = self->_initialCentroidInSourceWindow.y;
  z = self->_initialCentroidInSourceWindow.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCentroidInSourceWindow:(CAPoint3D)a3
{
  self->_initialCentroidInSourceWindow = a3;
}

- (BOOL)wantsPresentationUpdates
{
  return self->_wantsPresentationUpdates;
}

- (void)setWantsPresentationUpdates:(BOOL)a3
{
  self->_wantsPresentationUpdates = a3;
}

- (BOOL)sessionIsRestrictedToSourceApplication
{
  return self->_sessionIsRestrictedToSourceApplication;
}

- (void)setSessionIsRestrictedToSourceApplication:(BOOL)a3
{
  self->_sessionIsRestrictedToSourceApplication = a3;
}

- (BOOL)sourceExpectsStagedLegacySelectors
{
  return self->_sourceExpectsStagedLegacySelectors;
}

- (void)setSourceExpectsStagedLegacySelectors:(BOOL)a3
{
  self->_sourceExpectsStagedLegacySelectors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredPreviewIndexes, 0);
  objc_storeStrong((id *)&self->_persistentSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_axEndpoint, 0);
  objc_storeStrong((id *)&self->_dataProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_routingPolicy, 0);
  objc_storeStrong((id *)&self->_coordinateSpaceSourceLayerContext, 0);
  objc_storeStrong((id *)&self->_touchIDs, 0);
}

+ (id)configurationWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 initialCentroidInSourceWindow:(CAPoint3D)a5 sourceView:(id)a6
{
  double z;
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _DUITargetLayerDescriptor *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;

  z = a5.z;
  y = a5.y;
  x = a5.x;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "_window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setItemCollection:", v13);

  objc_msgSend(v16, "setDataProviderEndpoint:", v12);
  v17 = objc_alloc_init(_DUITargetLayerDescriptor);
  objc_msgSend(v11, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUITargetLayerDescriptor setContextID:](v17, "setContextID:", objc_msgSend(v19, "contextId"));

  objc_msgSend(v11, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUITargetLayerDescriptor setRenderID:](v17, "setRenderID:", CALayerGetRenderId());

  objc_msgSend(v15, "systemShellHostingEnvironment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "systemShellHostingSpaceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUITargetLayerDescriptor setSystemShellHostingSpaceIdentifier:](v17, "setSystemShellHostingSpaceIdentifier:", v22);

  objc_msgSend(v16, "setCoordinateSpaceSourceLayerContext:", v17);
  objc_msgSend(v15, "_sceneIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSceneIdentifier:", v23);

  objc_msgSend(v15, "session");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "persistentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPersistentSceneIdentifier:", v25);

  objc_msgSend(v16, "setInitiatedWithPointer:", 1);
  objc_msgSend(v16, "setSupportsSystemDrag:", 1);
  objc_msgSend(v16, "setInitialCentroidInSourceWindow:", x, y, z);
  objc_msgSend(v16, "setSourceExpectsStagedLegacySelectors:", 1);
  objc_msgSend(v11, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", v26, x, y);
  v28 = v27;
  v30 = v29;

  objc_msgSend(v16, "set_initialCentroid:", v28, v30, 0.0);
  return v16;
}

@end
