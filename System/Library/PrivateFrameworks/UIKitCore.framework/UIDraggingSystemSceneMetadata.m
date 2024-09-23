@implementation UIDraggingSystemSceneMetadata

- (UIDraggingSystemSceneMetadata)initWithCoder:(id)a3
{
  id v4;
  UIDraggingSystemSceneMetadata *v5;
  uint64_t v6;
  NSString *activityType;
  uint64_t v8;
  NSString *sceneIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIDraggingSystemSceneMetadata;
  v5 = -[UIDraggingSystemSceneMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
    v6 = objc_claimAutoreleasedReturnValue();
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIDraggingSystemSceneMetadata activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityType"));

  -[UIDraggingSystemSceneMetadata sceneIdentifier](self, "sceneIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sceneIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
