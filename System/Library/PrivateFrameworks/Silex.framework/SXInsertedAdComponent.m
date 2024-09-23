@implementation SXInsertedAdComponent

- (SXInsertedAdComponent)initWithAdType:(unint64_t)a3
{
  SXInsertedAdComponent *v4;
  SXInsertedAdComponent *v5;
  void *v6;
  uint64_t v7;
  NSString *placementIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXInsertedAdComponent;
  v4 = -[SXInsertedAdComponent init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_adType = a3;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    placementIdentifier = v5->_placementIdentifier;
    v5->_placementIdentifier = (NSString *)v7;

  }
  return v5;
}

- (NSString)type
{
  return (NSString *)CFSTR("advertisement");
}

- (int)role
{
  return 34;
}

- (unint64_t)contentRelevance
{
  return 1;
}

- (SXComponentClassification)classification
{
  void *v2;
  void *v3;

  -[SXInsertedAdComponent type](self, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXComponentClassification classificationForComponentWithType:](SXComponentClassification, "classificationForComponentWithType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SXComponentClassification *)v3;
}

- (unint64_t)traits
{
  return 16;
}

- (UIColor)debugColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "cyanColor");
}

- (unint64_t)placementType
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (SXComponentAnimation)animation
{
  return self->_animation;
}

- (SXJSONArray)behaviors
{
  return self->_behaviors;
}

- (unint64_t)adType
{
  return self->_adType;
}

- (NSString)placementIdentifier
{
  return self->_placementIdentifier;
}

- (NSString)style
{
  return self->_style;
}

- (SXComponentAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (NSString)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (SXComponentConditions)conditions
{
  return self->_conditions;
}

- (SXJSONDictionary)advertising
{
  return self->_advertising;
}

- (SXJSONDictionary)analytics
{
  return self->_analytics;
}

- (SXJSONArray)additions
{
  return self->_additions;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_advertising, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_placementIdentifier, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
