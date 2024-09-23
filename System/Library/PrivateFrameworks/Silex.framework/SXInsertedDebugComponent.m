@implementation SXInsertedDebugComponent

- (NSString)type
{
  return (NSString *)CFSTR("anf-internal-debug");
}

- (int)role
{
  return 0;
}

- (unint64_t)contentRelevance
{
  return 1;
}

- (SXComponentClassification)classification
{
  return (SXComponentClassification *)+[SXComponentClassification classificationForComponentWithRole:](SXComponentClassification, "classificationForComponentWithRole:", 0);
}

- (unint64_t)traits
{
  return 0;
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

- (SXJSONDictionary)analytics
{
  return self->_analytics;
}

- (SXJSONArray)additions
{
  return self->_additions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
